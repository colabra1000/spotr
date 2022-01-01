part of 'registration_page_bloc.dart';

abstract class RegistrationPageState extends Equatable {
  const RegistrationPageState();

  @override
  List<Object> get props => [];
}

class RegistrationPageInitial extends RegistrationPageState {}

class InterestsState extends RegistrationPageState {
  final List interests;
  const InterestsState({required this.interests});

  @override
  List<Object> get props => [interests];
}
