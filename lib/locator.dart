import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:spotr/features/main_app/domain/usecases/get_user_info.dart';
import 'package:spotr/features/main_app/domain/usecases/update_user_info.dart';
import 'package:spotr/features/main_app/presentation/bloc/settings_page/settings_page_bloc.dart';

import 'core/features/main_app/bloc/main_app_bloc.dart';
import 'core/usecases/change_app_state.dart';
import 'features/authentication/domain/usecases/log_out_user.dart';
import 'features/main_app/data/datasource/main_app_remote_datasource.dart';
import 'features/main_app/data/repository/main_app_repository_impl.dart';
import 'features/main_app/domain/repository/main_app_repository.dart';
import 'features/main_app/domain/usecases/listen_to_user_info.dart';
import 'features/main_app/presentation/bloc/profile_page/profile_page_bloc.dart';
import 'core/features/app_controller/bloc/app_bloc.dart';
import 'core/features/authentication/bloc/authentication_bloc.dart';
import 'features/authentication/data/repository/authentication_repository_impl.dart';
import 'features/authentication/domain/usecases/check_email_verification_status.dart';
import 'features/authentication/domain/usecases/listen_to_user_login_status.dart';
import 'features/authentication/domain/usecases/login_user.dart';
import 'features/authentication/domain/usecases/register_user.dart';
import 'features/authentication/domain/usecases/send_password_reset_link.dart';
import 'features/authentication/data/datasource/authentication_remote_datasource.dart';
import 'features/authentication/domain/repository/authentication_repository.dart';
import 'features/authentication/domain/usecases/send_verification_email.dart';

import 'core/route/auto_router.gr.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //datasources
  locator.registerLazySingleton<AuthenticationRemoteDatasource>(() =>
      AutnhenticationRemoteDatasourceImpl(
          firebaseAuth: locator(), firebaseFirestore: locator()));

  locator.registerLazySingleton<MainAppRemoteDatasource>(() =>
      MainAppRemoteDatasourceImpl(
          firebaseAuth: locator(), firebaseFirestore: locator()));

  //repositories
  locator.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(remoteDatasource: locator()));

  locator.registerLazySingleton<MainAppRepository>(
      () => MainAppRepositoryImpl(remoteDatasource: locator()));

  //usecases
  locator.registerLazySingleton(() => RegisterUser(repository: locator()));
  locator.registerLazySingleton(() => ChangeAppState(appBloc: locator()));
  locator.registerLazySingleton(
      () => SendPasswordResetLink(repository: locator()));

  locator.registerLazySingleton(() => LoginUser(repository: locator()));

  locator.registerLazySingleton(() => LogOutUser(repository: locator()));

  locator.registerLazySingleton(
      () => CheckEmailVerificationStatus(repository: locator()));
  locator.registerLazySingleton(
      () => ListenToUserLoginStatus(repository: locator()));

  locator.registerLazySingleton(
      () => SendVerificationEmail(repository: locator()));

  locator.registerLazySingleton(() => ListenToUserInfo(repository: locator()));
  locator.registerLazySingleton(() => GetUserInfo(repository: locator()));
  locator.registerLazySingleton(() => UpdateUserInfo(repository: locator()));

  //bloc
  locator.registerLazySingleton(() => AuthenticationBloc(
        appRouter: locator(),
        changeAppState: locator(),
        logOutUser: locator(),
        checkEmailVerificationStatus: locator(),
        registerUser: locator(),
        loginUser: locator(),
        listenToUserLoginStatus: locator(),
        sendVerificationEmail: locator(),
        sendPasswordResetLink: locator(),
      ));

  locator.registerLazySingleton(() => AppBloc(
        listenToUserLoginStatus: locator(),
      ));

  locator.registerFactory(() => MainAppBloc(
        listenToUserInfo: locator(),
      ));

  locator.registerFactory(() => SettingsPageBloc(
      getUserInfo: locator(),
      updateUserInfo: locator(),
      listenToUserInfo: locator()));

  // locator.registerLazySingleton(() => ProfilePageBloc());

  //core
  locator.registerLazySingleton<AppRouter>(() => AppRouter());

  //externals
  locator.registerLazySingleton(() => FirebaseAuth.instance);
  locator.registerLazySingleton(() => FirebaseFirestore.instance);
}
