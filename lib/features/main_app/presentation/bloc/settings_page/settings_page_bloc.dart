import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:spotr/core/features/main_app/bloc/main_app_bloc.dart';
import 'package:spotr/features/authentication/data/model/user_info_model.dart';
import 'package:spotr/features/authentication/domain/entities/user_info.dart';
import 'package:spotr/features/main_app/domain/usecases/get_user_info.dart';
import 'package:spotr/features/main_app/domain/usecases/listen_to_user_info.dart';
import 'package:spotr/features/main_app/domain/usecases/update_user_info.dart';

part 'settings_page_event.dart';
part 'settings_page_state.dart';

class SettingsPageBloc extends Bloc<SettingsPageEvent, SettingsPageState> {
  GetUserInfo getUserInfo;
  UpdateUserInfo updateUserInfo;

  UserInfo? userInfo;

  SettingsPageBloc({required this.getUserInfo, required this.updateUserInfo})
      : super(SettingsPageInitial()) {
    on<SettingsPageEvent>((event, emit) async {
      // if (event is InitializeSettingsEvent) {
      //   final result = await getUserInfo(null);
      //   result.fold((l) => null, (r) {
      //     _listenToAndBuildUserInfo(r);
      //   });
      // }

      if (event is InitializeSettingsEvent) {
        final result = await getUserInfo(null);
        result.fold((l) => null, (r) {
          userInfo = r;
          print("zen");
          print(r);
        });
      }

      if (event is UpdateEmailEvent) {
        emit(SettingsPageIdle(
            settingsType: SettingsType.updateEmail,
            fieldValue: userInfo?.email ?? ""));
      }

      if (event is UpdatePasswordEvent) {
        emit(const SettingsPageIdle(
            settingsType: SettingsType.updatePassword, fieldValue: ""));
      }

      if (event is UpdateUsernameEvent) {
        print(userInfo?.username);
        emit(SettingsPageIdle(
            settingsType: SettingsType.updateUsername,
            fieldValue: userInfo?.username ?? ""));
      }

      // if (event is UpdateUsernameEvent) {
      //   emit(SettingsPageState.updateUsername);
      // }

      // if (event is UpdatePasswordEvent) {
      //   emit(SettingsPageState.updatePassword);
      // }
    });

    add(InitializeSettingsEvent());
  }

  _listenToAndBuildUserInfo(Stream<DocumentSnapshot<Object?>> result) {
    result.listen((event) {
      final data = event.data() as Map<String, dynamic>;
      userInfo = UserInfoModel.fromJson(data);
      print("meeeee");
      print(updateUserInfo);

      //cannot emit from here
      // add(UpdateUserDetailEvent(userInfo: userInfo));

      // profilePageBloc.add(UpdateUserDetailEvent(userInfo: userInfo));
    });
  }
}
