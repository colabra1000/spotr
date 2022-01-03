import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide UserInfo;
import 'package:spotr/core/errors/errorTypes.dart';
import 'package:spotr/core/errors/exceptions.dart';
import 'package:spotr/features/authentication/data/model/user_info_model.dart';
import 'package:spotr/features/authentication/domain/entities/user_info.dart';
import 'package:spotr/features/main_app/domain/usecases/update_user_info.dart';
import 'package:spotr/features/main_app/presentation/bloc/settings_page/settings_page_bloc.dart';

abstract class MainAppRemoteDatasource {
  Stream<DocumentSnapshot<Object?>> listenToUserInfo();
  Future<UserInfo?> getUserInfo();
  Future<String> updateUserInfo({required UpdateUserInfoParam userInfoParam});
}

class MainAppRemoteDatasourceImpl implements MainAppRemoteDatasource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  User? _user;
  UserInfo? _userInfo;

  MainAppRemoteDatasourceImpl(
      {required this.firebaseAuth, required this.firebaseFirestore});

  @override
  Stream<DocumentSnapshot<Object?>> listenToUserInfo() {
    _user = firebaseAuth.currentUser;

    if (_user == null) {
      throw ServerException(errorTypes: ErrorTypes.userNotSignedIn);
    }

    CollectionReference userInfo = firebaseFirestore.collection('user_info');

    // final doc = await userInfo.doc(_user!.uid).get();
    // final json = doc.data() as Map<String, dynamic>;
    // _userInfo = UserInfoModel.fromJson(json);

    return userInfo.doc(_user!.uid).snapshots();
  }

  @override
  Future<UserInfo?> getUserInfo() async {
    CollectionReference userInfo = firebaseFirestore.collection('user_info');

    final doc = await userInfo.doc(_user!.uid).get();
    final json = doc.data() as Map<String, dynamic>;
    return UserInfoModel.fromJson(json);
  }

  @override
  Future<String> updateUserInfo(
      {required UpdateUserInfoParam userInfoParam}) async {
    if (userInfoParam.settingsType == SettingsType.updateUsername) {
      CollectionReference userInfo = firebaseFirestore.collection('user_info');
      final check = await userInfo
          .where("username", isEqualTo: userInfoParam.fieldValue)
          .get();
      if (check.docs.isNotEmpty) {
        throw ServerException(errorTypes: ErrorTypes.userNameAlreadyInUse);
      }
      await userInfo
          .doc(_user!.uid)
          .update({"username": userInfoParam.fieldValue});
      return "success";
    }

    // if (userInfoParam.settingsType == SettingsType.updatePassword) {
    //   await _user!.verifyBeforeUpdateEmail(userInfoParam.fieldValue);
    //   return "success";
    // }

    throw ServerException(errorTypes: ErrorTypes.unKnown);
  }
}
