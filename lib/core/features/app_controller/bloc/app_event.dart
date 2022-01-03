part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends Equatable {
  const AppEvent();
  @override
  List<Object?> get props => [];
}

class BeginAppInitializationEvent extends AppEvent {}

class AppLoggedInEvent extends AppEvent {}

class AppLoggedOutEvent extends AppEvent {}



// class AppStateEvent extends AppEvent {
//   final bool isLoggedIn;
//   const AppStateEvent({required this.isLoggedIn});

//   @override
//   List<Object?> get props => [isLoggedIn];
// }
