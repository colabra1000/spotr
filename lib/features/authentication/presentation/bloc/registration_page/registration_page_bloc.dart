import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'registration_page_event.dart';
part 'registration_page_state.dart';

class RegistrationPageBloc
    extends Bloc<RegistrationPageEvent, RegistrationPageState> {
  RegistrationPageBloc() : super(RegistrationPageInitial()) {
    on<RegistrationPageEvent>((event, emit) {
      if (event is SelectInterests) {
        emit(InterestsState(interests: event.interests));
      }
    });
  }
}
