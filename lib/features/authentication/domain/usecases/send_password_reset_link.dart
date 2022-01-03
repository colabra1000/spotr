import 'package:spotr/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../repository/authentication_repository.dart';
import '../../../../core/usecases/usecases.dart';

class SendPasswordResetLink implements UseCases<String, String> {
  AuthenticationRepository repository;

  SendPasswordResetLink({required this.repository});

  @override
  Future<Either<Failure, String>> call(String params) async {
    return repository.sendPasswordResetLink(email: params);
  }
}
