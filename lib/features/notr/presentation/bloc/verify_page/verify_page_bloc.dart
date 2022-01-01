import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'verify_page_event.dart';
part 'verify_page_state.dart';

class VerifyPageBloc extends Bloc<VerifyPageEvent, VerifyPageState> {
  VerifyPageBloc() : super(VerifyPageInitial()) {
    on<VerifyPageEvent>((event, emit) {
      if (event is VerifyByEmailEvent) {
        emit(VerifyByEmail(emailSent: event.emailSent));
      }

      if (event is VerifyByPhoneEvent) {
        emit(VerifyByPhone(codeSent: event.codeSent));
      }
    });
  }
}
