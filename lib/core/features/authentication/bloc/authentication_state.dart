part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationIdleState extends AuthenticationState {}

class AuthenticationWorkingState extends AuthenticationState {}

class AuthenticationErrorState extends AuthenticationState {
  final String errorMessage;
  const AuthenticationErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class AuthenticationAlertState extends AuthenticationState {
  final String alertMessage;
  const AuthenticationAlertState({required this.alertMessage});

  @override
  List<Object> get props => [alertMessage];
}
