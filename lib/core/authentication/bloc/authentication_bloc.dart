import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:c_modal/c_modal.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotr/core/dto/login_request.dart';
import 'package:spotr/core/dto/register_request.dart';
import 'package:spotr/core/errors/errorTypes.dart';
import 'package:spotr/core/errors/failures.dart';
import 'package:spotr/core/locator.dart';
import 'package:spotr/core/route/auto_router.gr.dart';
import 'package:spotr/features/notr/domain/usecases/check_email_verification_status.dart';
import 'package:spotr/features/notr/domain/usecases/listen_to_user_login_status.dart';
import 'package:spotr/features/notr/domain/usecases/login_user.dart';
import 'package:spotr/features/notr/domain/usecases/register_user.dart';
import 'package:spotr/features/notr/domain/usecases/send_password_reset_link.dart';
import 'package:spotr/features/notr/domain/usecases/send_verification_email.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  RegisterUser registerUser;
  LoginUser loginUser;
  ListenToUserLoginStatus getUserLoginStatus;
  SendVerificationEmail sendVerificationEmail;
  CheckEmailVerificationStatus checkEmailVerificationStatus;
  SendPasswordResetLink sendPasswordResetLink;

  StreamSubscription? _listenToUserLoginStatusStreamSubscription;
  StreamSubscription? _checkEmailVerificationStatusStreamSubscription;

  AuthenticationBloc({
    required this.registerUser,
    required this.loginUser,
    required this.getUserLoginStatus,
    required this.sendVerificationEmail,
    required this.checkEmailVerificationStatus,
    required this.sendPasswordResetLink,
  }) : super(AuthenticationInitial()) {
    getUserLoginStatus
        .call(null)
        .then((value) => _listenToUserLoginStatus(value));

    on<AuthenticationEvent>((event, emit) async {
      if (event is LoginEvent) {
        await _loginUser(event, emit);
      }

      if (event is RegistrationEvent) {
        await _registerUser(event, emit);
      }

      //navigate to verify user page and
      //immediately start listening to email verification status.
      if (event is VerifyUserEvent) {
        locator<AppRouter>().push(const VerifyRoute());
        await _listenToEmailVerificationStatus(emit);
      }

      //just navigate to user verification page.
      if (event is SignUserInEvent) {
        locator<AppRouter>().push(HomeRoute());
      }

      if (event is SendPasswordResetLinkEvent) {
        emit(AuthenticationWorkingState());
        final result = await sendPasswordResetLink(event.email);
        emit(AuthenticationIdleState());

        result.fold((failure) {
          _emitErrorStates(emit, failure.errorTypes);
        }, (String success) async {
          locator<AppRouter>().navigateBack();
          _emitAlertState(
              emit,
              "password resent link has been sent to your"
              " email address");
        });
      }

      if (event is SendVerificationEmailEvent) {
        emit(AuthenticationWorkingState());
        Either<Failure, String> result = await sendVerificationEmail(null);
        emit(AuthenticationIdleState());

        result.fold((failure) {
          _emitErrorStates(emit, failure.errorTypes);
        }, (_) async {});
      }
    });
  }

  _listenToEmailVerificationStatus(Emitter emit) async {
    (await checkEmailVerificationStatus(5)).fold(
        (failure) => _emitErrorStates(emit, failure.errorTypes), (Stream r) {
      _checkEmailVerificationStatusStreamSubscription?.cancel();
      _checkEmailVerificationStatusStreamSubscription = r.listen(
        (event) {
          //if email is verified
          //sign user in
          //cancel subscription
          if (event == true) {
            add(SignUserInEvent());
            _checkEmailVerificationStatusStreamSubscription?.cancel();
          }
        },
      );
    });
  }

  _loginUser(LoginEvent event, Emitter emit) async {
    emit(AuthenticationWorkingState());

    Either<Failure, String> result = await loginUser(LoginRequest(
        usernameOrPhoneNumber: event.usernameOrPhoneNumber,
        password: event.password));

    emit(AuthenticationIdleState());

    result.fold((Failure failure) {
      if (failure.errorTypes == ErrorTypes.userNotVerified) {
        add(VerifyUserEvent());
      } else {
        _emitErrorStates(emit, failure.errorTypes);
      }
    }, (_) {
      add(SignUserInEvent());
    });
  }

  _registerUser(RegistrationEvent event, Emitter emit) async {
    emit(AuthenticationWorkingState());

    final result = await registerUser(RegisterRequest(
      username: event.username,
      password: event.password,
      phoneNumber: event.phoneNumber,
      email: event.email,
      interests: event.interests,
    ));

    emit(AuthenticationIdleState());

    result.fold(
      (failure) => _emitErrorStates(emit, failure.errorTypes),
      (_) => add(VerifyUserEvent()),
    );
  }

  _listenToUserLoginStatus(Either<Failure, Stream> value) {
    value.fold((failure) => null, (r) {
      _listenToUserLoginStatusStreamSubscription?.cancel();
      _listenToUserLoginStatusStreamSubscription = r.listen((user) {
        if (user is User) {
          print("user is signed in");
        } else {
          print("user is currently signed out");
        }
      });
    });
  }

  _emitAlertState(Emitter emit, String alertMessage) {
    emit(AuthenticationAlertState(alertMessage: alertMessage));
  }

  _emitErrorStates(Emitter emit, ErrorTypes? errorTypes) {
    switch (errorTypes) {
      case ErrorTypes.userDoesNotExist:
        emit(const AuthenticationErrorState(
            errorMessage: "user does not exist"));
        break;
      case ErrorTypes.emailAlreadyInUse:
        emit(const AuthenticationErrorState(
            errorMessage: "email already in use. you may use another email!"));
        break;
      case ErrorTypes.networkError:
        emit(const AuthenticationErrorState(errorMessage: "network error"));
        break;
      case ErrorTypes.userNameAlreadyInUse:
        emit(const AuthenticationErrorState(
            errorMessage: "username already in use"));
        break;

      case ErrorTypes.phoneNumberAlreadyInUse:
        emit(const AuthenticationErrorState(
            errorMessage: "phone number already in use"));
        break;

      case ErrorTypes.emailNotRegistered:
        emit(const AuthenticationErrorState(
            errorMessage: "email is not registered"));
        break;

      case ErrorTypes.wrongPassword:
        emit(const AuthenticationErrorState(errorMessage: "wrong password"));
        break;

      case ErrorTypes.emailAlreadyVerified:
        // TODO: Handle this case.
        break;
      default:
        emit(const AuthenticationErrorState(errorMessage: "error"));
        break;
    }
  }

  @override
  Future<void> close() {
    _listenToUserLoginStatusStreamSubscription?.cancel();
    _checkEmailVerificationStatusStreamSubscription?.cancel();
    return super.close();
  }
}
