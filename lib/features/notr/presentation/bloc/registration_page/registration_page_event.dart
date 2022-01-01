part of 'registration_page_bloc.dart';

abstract class RegistrationPageEvent extends Equatable {
  const RegistrationPageEvent();

  @override
  List<Object> get props => [];
}

class SelectInterests extends RegistrationPageEvent {
  final List interests;
  const SelectInterests({required this.interests});

  @override
  List<Object> get props => [interests];
}
