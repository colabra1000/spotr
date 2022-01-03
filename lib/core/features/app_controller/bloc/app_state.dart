part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

// class InitializationComplete extends AppState {
//   final bool loggedIn;
//   InitializationComplete({required this.loggedIn});
// }

class AppLoggedInState extends AppState {}

class AppLoggedOutState extends AppState {}
