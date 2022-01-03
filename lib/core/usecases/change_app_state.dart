import 'package:spotr/core/features/main_app/bloc/main_app_bloc.dart';

import '../features/app_controller/bloc/app_bloc.dart';

class ChangeAppState {
  AppBloc appBloc;
  ChangeAppState({required this.appBloc});

  toLoggedIn() {
    appBloc.add(AppLoggedInEvent());
  }

  toLoggedOut() {
    appBloc.add(AppLoggedOutEvent());
  }
}
