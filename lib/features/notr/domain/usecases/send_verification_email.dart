import 'package:spotr/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:spotr/features/notr/domain/repository/authentication_repository.dart';
import 'package:spotr/features/notr/domain/usecases/usecases.dart';

class SendVerificationEmail implements UseCases<String, dynamic> {
  AuthenticationRepository repository;

  SendVerificationEmail({required this.repository});

  @override
  Future<Either<Failure, String>> call(params) async {
    return repository.sendVerificationEmail();
  }
}
