part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthenticationEvent {
  final String usernameOrPhoneNumber;
  final String password;

  const LoginEvent(
      {required this.usernameOrPhoneNumber, required this.password});

  @override
  List<Object> get props => [usernameOrPhoneNumber, password];
}

class RegistrationEvent extends AuthenticationEvent {
  final String username;
  final String email;
  final String phoneNumber;
  final String password;
  final List interests;

  const RegistrationEvent(
      {required this.username,
      required this.email,
      required this.phoneNumber,
      required this.interests,
      required this.password});

  @override
  List<Object> get props => [
        username,
        password,
        email,
        interests,
        phoneNumber,
      ];
}

class VerifyUserEvent extends AuthenticationEvent {}

class SendVerificationEmailEvent extends AuthenticationEvent {}

class SendVerificationCodeEvent extends AuthenticationEvent {}

class SendPasswordResetLinkEvent extends AuthenticationEvent {
  final String email;

  const SendPasswordResetLinkEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class SignUserInEvent extends AuthenticationEvent {}
