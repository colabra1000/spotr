import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'authentication/bloc/authentication_bloc.dart';
import '../features/authentication/data/datasource/remote_datasource.dart';
import '../features/authentication/data/repository/authentication_repository_impl.dart';
import '../features/authentication/domain/repository/authentication_repository.dart';
import '../features/authentication/domain/usecases/check_email_verification_status.dart';
import '../features/authentication/domain/usecases/listen_to_user_login_status.dart';
import '../features/authentication/domain/usecases/login_user.dart';
import '../features/authentication/domain/usecases/register_user.dart';
import '../features/authentication/domain/usecases/send_password_reset_link.dart';
import '../features/authentication/domain/usecases/send_verification_email.dart';

import 'app_logic/bloc/app_bloc.dart';
import 'route/auto_router.gr.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //datasources
  locator.registerLazySingleton<RemoteDatasource>(() =>
      AutnhenticationDatasourceImpl(
          firebaseAuth: locator(), firebaseFirestore: locator()));

  //repositories
  locator.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(remoteDatasource: locator()));

  //usecases
  locator.registerLazySingleton(() => RegisterUser(repository: locator()));
  locator.registerLazySingleton(
      () => SendPasswordResetLink(repository: locator()));
  locator.registerLazySingleton(() => LoginUser(repository: locator()));
  locator.registerLazySingleton(
      () => CheckEmailVerificationStatus(repository: locator()));
  locator.registerLazySingleton(
      () => ListenToUserLoginStatus(repository: locator()));
  locator.registerLazySingleton(
      () => SendVerificationEmail(repository: locator()));

  //bloc
  locator.registerFactory(() => AuthenticationBloc(
        checkEmailVerificationStatus: locator(),
        registerUser: locator(),
        loginUser: locator(),
        getUserLoginStatus: locator(),
        sendVerificationEmail: locator(),
        sendPasswordResetLink: locator(),
      ));

  locator.registerFactory(() => AppBloc());

  //core
  locator.registerLazySingleton<AppRouter>(() => AppRouter());

  //externals
  locator.registerLazySingleton(() => FirebaseAuth.instance);
  locator.registerLazySingleton(() => FirebaseFirestore.instance);
}
