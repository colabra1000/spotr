import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotr/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:spotr/features/authentication/domain/entities/user_info.dart';
import 'package:spotr/features/main_app/presentation/bloc/settings_page/settings_page_bloc.dart';
import 'package:spotr/features/main_app/presentation/bloc/settings_page/settings_page_bloc.dart';
import 'package:spotr/features/main_app/presentation/bloc/settings_page/settings_page_bloc.dart';
import '../repository/main_app_repository.dart';
import 'usecases.dart';

class UpdateUserInfo implements UseCases<String, UpdateUserInfoParam> {
  MainAppRepository repository;

  UpdateUserInfo({required this.repository});

  @override
  Future<Either<Failure, String>> call(userInfoParam) async {
    return repository.updateUserInfo(userInfoParam: userInfoParam);
  }
}

class UpdateUserInfoParam {
  final SettingsType settingsType;
  final String fieldValue;

  const UpdateUserInfoParam(
      {required this.settingsType, required this.fieldValue});
}
