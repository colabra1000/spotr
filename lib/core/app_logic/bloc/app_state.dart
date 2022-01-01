part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class InitializationComplete extends AppState {}

class AuthenticationComplete extends AppState {}
