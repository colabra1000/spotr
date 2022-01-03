import 'package:dartz/dartz.dart';
import 'package:spotr/core/dto/login_request.dart';
import 'package:spotr/core/dto/register_request.dart';
import 'package:spotr/core/errors/failures.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, String>> registerUser(
      {required RegisterRequest registerRequest});

  Future<Either<Failure, String>> loginUser(
      {required LoginRequest loginRequest});

  Either<Failure, Stream> listenToUserLoginStatus();

  Either<Failure, Stream> checkEmailVerificationStatus(
      {required int delayInSeconds});

  Future<Either<Failure, String>> sendVerificationEmail();

  Future<Either<Failure, String>> logOutUser();

  Future<Either<Failure, String>> sendPasswordResetLink(
      {required String email});
}
