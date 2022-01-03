import 'package:spotr/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../repository/authentication_repository.dart';
import '../../../../core/usecases/usecases.dart';

class ListenToUserLoginStatus implements UseCases<Stream, dynamic> {
  AuthenticationRepository repository;

  ListenToUserLoginStatus({required this.repository});

  @override
  Future<Either<Failure, Stream>> call(params) async {
    return repository.listenToUserLoginStatus();
  }
}
