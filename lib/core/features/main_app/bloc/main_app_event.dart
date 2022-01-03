part of 'main_app_bloc.dart';

abstract class MainAppEvent extends Equatable {
  const MainAppEvent();

  @override
  List<Object> get props => [];
}

class InitializeMainAppEvent extends MainAppEvent {}

// class FinishMainAppEvent extends MainAppEvent {}

class UpdateUserDetailEvent extends MainAppEvent {
  final UserInfo userInfo;

  const UpdateUserDetailEvent({required this.userInfo});
}
