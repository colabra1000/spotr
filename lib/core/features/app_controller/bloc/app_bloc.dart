import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:spotr/core/features/main_app/bloc/main_app_bloc.dart';
import '../../../errors/failures.dart';
import '../../../usecases/change_app_state.dart';
import '../../../../features/authentication/domain/usecases/listen_to_user_login_status.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  ListenToUserLoginStatus listenToUserLoginStatus;

  StreamSubscription? _listenToUserLoginStatusStreamSubscription;

  AppBloc({required this.listenToUserLoginStatus}) : super(AppInitial()) {
    on<AppEvent>((event, emit) async {
      if (event is BeginAppInitializationEvent) {
        //delay 2 seconds
        await Future.delayed(const Duration(seconds: 2));
        final result = await listenToUserLoginStatus(null);
        _listenToUserLoginStatus(emit, result);
      }

      if (event is AppLoggedInEvent) {
        emit(AppLoggedInState());
        // _initializeMainApp();
      }

      if (event is AppLoggedOutEvent) {
        emit(AppLoggedOutState());
      }
    });

    add(BeginAppInitializationEvent());
  }

  // _initializeMainApp() {
  //   mainAppBloc.add(InitializeMainAppEvent());
  // }

  _listenToUserLoginStatus(Emitter emit, Either<Failure, Stream> value) async {
    value.fold((failure) => null, (r) {
      _listenToUserLoginStatusStreamSubscription?.cancel();
      _listenToUserLoginStatusStreamSubscription = r.listen((user) {
        if (user != null) {
          add(AppLoggedInEvent());
        } else {
          add(AppLoggedOutEvent());
        }
        _listenToUserLoginStatusStreamSubscription?.cancel();
      });
    });
  }
}
