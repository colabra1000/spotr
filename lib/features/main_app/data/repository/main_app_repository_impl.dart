import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotr/core/errors/failures.dart';
import 'package:spotr/features/authentication/domain/entities/user_info.dart';

import '../datasource/main_app_remote_datasource.dart';
import '../../domain/repository/main_app_repository.dart';

class MainAppRepositoryImpl implements MainAppRepository {
  MainAppRemoteDatasource remoteDatasource;
  MainAppRepositoryImpl({required this.remoteDatasource});

  @override
  Either<Failure, Stream<DocumentSnapshot<Object?>>> listenToUserInfo() {
    try {
      return Right(remoteDatasource.listenToUserInfo());
    } on Exception catch (e) {
      return Left(ServerFailure.handleServerFailureException(e));
    }
  }

  @override
  Future<Either<Failure, UserInfo?>> getUserInfo() async {
    try {
      final result = await remoteDatasource.getUserInfo();
      return Future.value(Right(result));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure.handleServerFailureException(e)));
    }
  }

  @override
  Future<Either<Failure, String>> updateUserInfo(
      {required UserInfo userInfo}) async {
    try {
      final result = await remoteDatasource.updateUserInfo(userInfo: userInfo);
      return Future.value(Right(result));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure.handleServerFailureException(e)));
    }
  }
}
