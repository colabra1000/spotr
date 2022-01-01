import 'package:spotr/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:spotr/features/notr/domain/repository/authentication_repository.dart';
import 'package:spotr/features/notr/domain/usecases/usecases.dart';

class SendPasswordResetLink implements UseCases<String, String> {
  AuthenticationRepository repository;

  SendPasswordResetLink({required this.repository});

  @override
  Future<Either<Failure, String>> call(String params) async {
    return repository.sendPasswordResetLink(email: params);
  }
}
