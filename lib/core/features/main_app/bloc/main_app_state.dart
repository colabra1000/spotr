part of 'main_app_bloc.dart';

abstract class MainAppState extends Equatable {
  const MainAppState();

  @override
  List<Object> get props => [];
}

class MainAppInitial extends MainAppState {}

class NewUserDetailState extends MainAppState {
  final UserInfo userInfo;
  const NewUserDetailState({required this.userInfo});

  @override
  List<Object> get props => [userInfo];
}
