part of 'verify_page_bloc.dart';

abstract class VerifyPageState extends Equatable {
  const VerifyPageState();

  @override
  List<Object> get props => [];
}

class VerifyPageInitial extends VerifyPageState {}

class VerifyByEmail extends VerifyPageState {
  final bool emailSent;
  const VerifyByEmail({required this.emailSent});

  @override
  List<Object> get props => [emailSent];
}

class VerifyByPhone extends VerifyPageState {
  final bool codeSent;
  const VerifyByPhone({required this.codeSent});

  @override
  List<Object> get props => [codeSent];
}

enum VerifyByEmailOrPhone { byEmail, byPhone }
