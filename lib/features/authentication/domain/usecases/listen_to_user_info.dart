import 'package:spotr/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../repository/authentication_repository.dart';
import 'usecases.dart';

class ListenToUserInfo implements UseCases<Stream, dynamic> {
  AuthenticationRepository repository;

  ListenToUserInfo({required this.repository});

  @override
  Future<Either<Failure, Stream>> call(params) async {
    return repository.listenToUserInfo();
  }
}
