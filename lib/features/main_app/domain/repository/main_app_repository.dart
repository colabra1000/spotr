import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotr/core/errors/failures.dart';
import 'package:spotr/features/authentication/domain/entities/user_info.dart';

abstract class MainAppRepository {
  Either<Failure, Stream<DocumentSnapshot<Object?>>> listenToUserInfo();

  Future<Either<Failure, UserInfo?>> getUserInfo();
  Future<Either<Failure, String>> updateUserInfo({required UserInfo userInfo});
}
