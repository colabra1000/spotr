import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:spotr/features/authentication/data/model/user_info_model.dart';
import 'package:spotr/features/authentication/domain/entities/user_info.dart';
import 'package:spotr/features/main_app/presentation/bloc/profile_page/profile_page_bloc.dart';

import '../../../../features/main_app/domain/usecases/listen_to_user_info.dart';

part 'main_app_event.dart';
part 'main_app_state.dart';

class MainAppBloc extends Bloc<MainAppEvent, MainAppState> {
  ListenToUserInfo listenToUserInfo;

  MainAppBloc({
    required this.listenToUserInfo,
  }) : super(MainAppInitial()) {
    on<MainAppEvent>((event, emit) async {
      if (event is InitializeMainAppEvent) {
        final result = await listenToUserInfo(null);
        result.fold((l) => null, (r) {
          _listenToAndBuildUserInfo(r);
        });
      }

      if (event is UpdateUserDetailEvent) {
        emit(NewUserDetailState(userInfo: event.userInfo));
      }
    });

    add(InitializeMainAppEvent());
  }

  _listenToAndBuildUserInfo(Stream<DocumentSnapshot<Object?>> result) {
    result.listen((event) {
      final data = event.data() as Map<String, dynamic>;
      UserInfoModel userInfo = UserInfoModel.fromJson(data);

      //cannot emit from here
      add(UpdateUserDetailEvent(userInfo: userInfo));

      // profilePageBloc.add(UpdateUserDetailEvent(userInfo: userInfo));
    });
  }
}
