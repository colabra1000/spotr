part of 'verify_page_bloc.dart';

abstract class VerifyPageEvent extends Equatable {
  const VerifyPageEvent();

  @override
  List<Object> get props => [];
}

class VerifyByEmailEvent extends VerifyPageEvent {
  final bool emailSent;
  const VerifyByEmailEvent({required this.emailSent});
  @override
  List<Object> get props => [emailSent];
}

class VerifyByPhoneEvent extends VerifyPageEvent {
  final bool codeSent;
  const VerifyByPhoneEvent({required this.codeSent});
  @override
  List<Object> get props => [codeSent];
}

// class VerificationSentEvent extends VerifyPageEvent {
//   final bool email, phone;
//   const VerificationSentEvent({this.email = false, this.phone = false});

//   @override
//   List<Object> get props => [phone, email];
// }
