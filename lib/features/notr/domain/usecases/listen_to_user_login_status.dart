import 'package:spotr/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:spotr/features/notr/domain/repository/authentication_repository.dart';
import 'package:spotr/features/notr/domain/usecases/usecases.dart';

class ListenToUserLoginStatus implements UseCases<Stream, dynamic> {
  AuthenticationRepository repository;

  ListenToUserLoginStatus({required this.repository});

  @override
  Future<Either<Failure, Stream>> call(params) async {
    return repository.listenToUserLoginStatus();
  }
}
