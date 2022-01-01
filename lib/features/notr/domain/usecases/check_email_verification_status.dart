import 'package:spotr/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:spotr/features/notr/domain/repository/authentication_repository.dart';
import 'package:spotr/features/notr/domain/usecases/usecases.dart';

class CheckEmailVerificationStatus implements UseCases<Stream, int> {
  AuthenticationRepository repository;

  CheckEmailVerificationStatus({required this.repository});

  @override
  Future<Either<Failure, Stream>> call(int params) async {
    return repository.checkEmailVerificationStatus(delayInSeconds: params);
  }
}
