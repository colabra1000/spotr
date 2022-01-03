import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:spotr/core/features/main_app/bloc/main_app_bloc.dart';
import 'package:spotr/features/authentication/data/model/user_info_model.dart';
import 'package:spotr/features/authentication/domain/entities/user_info.dart';
import 'package:spotr/features/authentication/presentation/widgets/enums.dart';
import 'package:spotr/features/main_app/domain/usecases/get_user_info.dart';
import 'package:spotr/features/main_app/domain/usecases/listen_to_user_info.dart';
import 'package:spotr/features/main_app/domain/usecases/update_user_info.dart';

part 'settings_page_event.dart';
part 'settings_page_state.dart';

class SettingsPageBloc extends Bloc<SettingsPageEvent, SettingsPageState> {
  GetUserInfo getUserInfo;
  UpdateUserInfo updateUserInfo;
  ListenToUserInfo listenToUserInfo;

  UserInfo? userInfo;

  SettingsPageBloc(
      {required this.getUserInfo,
      required this.updateUserInfo,
      required this.listenToUserInfo})
      : super(SettingsPageInitial()) {
    on<SettingsPageEvent>((event, emit) async {
      if (event is InitializeSettingsEvent) {
        final result = await listenToUserInfo(null);
        result.fold((l) => null, (r) {
          _listenToAndBuildUserInfo(r);
        });
      }

      // if (event is InitializeSettingsEvent) {
      //   final result = await getUserInfo(null);
      //   result.fold((l) => null, (r) {
      //     userInfo = r;
      //   });
      // }

      if (event is NavigateToUpdateEmailPageEvent) {
        if (userInfo == null) {
          await _getUserInfo(emit);
        }
        if (userInfo != null) {
          emit(SettingsPageIdle(
              settingsType: SettingsType.updateEmail,
              fieldValue: userInfo?.email ?? ""));
        }
      }

      if (event is NavigateToUpdatePasswordPageEvent) {
        if (userInfo == null) {
          await _getUserInfo(emit);
        }
        if (userInfo != null) {
          emit(const SettingsPageIdle(
              settingsType: SettingsType.updatePassword, fieldValue: ""));
        }
      }

      if (event is NavigateToUpdateUsernamePageEvent) {
        if (userInfo == null) {
          await _getUserInfo(emit);
        }
        if (userInfo != null) {
          emit(SettingsPageIdle(
              settingsType: SettingsType.updateUsername,
              fieldValue: userInfo?.username ?? ""));
        }
      }

      if (event is UpdateUserInfoEvent) {
        emit(SettingsPageWorking());
        final result = await updateUserInfo(UpdateUserInfoParam(
            settingsType: event.settingsType, fieldValue: event.fieldValue));

        result.fold(
            (l) =>
                emit(SettingsPageError(errorMessage: l.errorTypes.toString())),
            (r) {
          emit(const SettingsPageAlert(alertMessage: "updated Successfully"));
        });

        //if successful emit alert
        //if failed emit error
        //emit finished.
      }
    });

    add(InitializeSettingsEvent());
  }

  Future<String?> _getUserInfo(Emitter emit) async {
    final result = await getUserInfo(null);
    result.fold((l) {
      emit(const SettingsPageError(errorMessage: "error"));
      return null;
    }, (r) {
      userInfo = r;
      return "success";
    });
  }

  _listenToAndBuildUserInfo(Stream<DocumentSnapshot<Object?>> result) {
    result.listen((event) {
      final data = event.data() as Map<String, dynamic>;
      userInfo = UserInfoModel.fromJson(data);
      print("listened user");
      print(userInfo);

      //cannot emit from here
      // add(UpdateUserDetailEvent(userInfo: userInfo));

      // profilePageBloc.add(UpdateUserDetailEvent(userInfo: userInfo));
    });
  }
}
