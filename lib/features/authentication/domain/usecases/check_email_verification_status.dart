import 'package:spotr/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../repository/authentication_repository.dart';
import '../../../../core/usecases/usecases.dart';

class CheckEmailVerificationStatus implements UseCases<Stream, int> {
  AuthenticationRepository repository;

  CheckEmailVerificationStatus({required this.repository});

  @override
  Future<Either<Failure, Stream>> call(int params) async {
    return repository.checkEmailVerificationStatus(delayInSeconds: params);
  }
}
