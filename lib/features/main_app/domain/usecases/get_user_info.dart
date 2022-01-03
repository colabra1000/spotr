import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotr/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:spotr/features/authentication/domain/entities/user_info.dart';
import '../repository/main_app_repository.dart';
import 'usecases.dart';

class GetUserInfo implements UseCases<UserInfo?, dynamic> {
  MainAppRepository repository;

  GetUserInfo({required this.repository});

  @override
  Future<Either<Failure, UserInfo?>> call(params) async {
    return repository.getUserInfo();
  }
}
