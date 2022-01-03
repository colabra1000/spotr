import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/dto/login_request.dart';
import '../../../../core/dto/register_request.dart';
import '../../../../core/errors/errorTypes.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../datasource/authentication_remote_datasource.dart';
import '../../domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRemoteDatasource remoteDatasource;
  AuthenticationRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, String>> registerUser(
      {required RegisterRequest registerRequest}) async {
    try {
      String success =
          await remoteDatasource.registerUser(registerRequest: registerRequest);
      return Future.value(Right(success));
    } on Exception catch (e) {
      return Future.value(Left(_handleServerFailureException(e)));
    }
  }

  @override
  Future<Either<Failure, String>> loginUser(
      {required LoginRequest loginRequest}) async {
    try {
      String success =
          await remoteDatasource.loginUser(loginRequest: loginRequest);
      return Future.value(Right(success));
    } on Exception catch (e) {
      return Future.value(Left(_handleServerFailureException(e)));
    }
  }

  @override
  Future<Either<Failure, String>> logOutUser() async {
    try {
      String success = await remoteDatasource.logOutUser();
      return Future.value(Right(success));
    } on Exception catch (e) {
      return Future.value(Left(_handleServerFailureException(e)));
    }
  }

  @override
  Either<Failure, Stream> listenToUserLoginStatus() {
    try {
      return Right(remoteDatasource.listenToUserLoginStatus());
    } on Exception catch (e) {
      return Left(_handleServerFailureException(e));
    }
  }

  @override
  Either<Failure, Stream> listenToUserInfo() {
    try {
      return Right(remoteDatasource.listenToUserLoginStatus());
    } on Exception catch (e) {
      return Left(_handleServerFailureException(e));
    }
  }

  @override
  Future<Either<Failure, String>> sendVerificationEmail() async {
    try {
      String success = await remoteDatasource.sendVerificationEmail();

      return Future.value(Right(success));
    } on Exception catch (e) {
      return Future.value(Left(_handleServerFailureException(e)));
    }
  }

  @override
  Either<Failure, Stream> checkEmailVerificationStatus(
      {required int delayInSeconds}) {
    try {
      Stream<bool> result =
          remoteDatasource.checkEmailVerificationStatus(delayInSeconds);

      return Right(result);
    } on Exception catch (e) {
      return Left(_handleServerFailureException(e));
    }
  }

  @override
  Future<Either<Failure, String>> sendPasswordResetLink(
      {required String email}) async {
    try {
      String success = await remoteDatasource.sendPasswordResetLink(email);

      return Future.value(Right(success));
    } on Exception catch (e) {
      return Future.value(Left(_handleServerFailureException(e)));
    }
  }

  ServerFailure _handleServerFailureException(e) {
    ServerFailure serverFailure;
    if (e is FirebaseException) {
      print(e.code);

      serverFailure = ServerFailure(
          message: e.message,
          code: e.code,
          errorTypes: _mapFireBaseExceptionErrorToErrorType(e.code));
    } else if (e is ServerException) {
      serverFailure = ServerFailure(
          message: e.message, code: e.code, errorTypes: e.errorTypes);
    } else {
      serverFailure = ServerFailure(message: e.toString());
    }

    return serverFailure;
  }

  ErrorTypes _mapFireBaseExceptionErrorToErrorType(String code) {
    switch (code.toLowerCase()) {
      case "wrong-password":
        return ErrorTypes.wrongPassword;
      case "email-already-in-use":
        return ErrorTypes.emailAlreadyInUse;
      case "network-request-failed":
        return ErrorTypes.networkError;
      case "user-not-found":
        return ErrorTypes.emailNotRegistered;

      default:
        return ErrorTypes.unKnown;
    }
  }
}
