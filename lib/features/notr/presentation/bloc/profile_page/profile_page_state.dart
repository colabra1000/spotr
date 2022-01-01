part of 'profile_page_bloc.dart';

abstract class ProfilePageState extends Equatable {
  const ProfilePageState();

  @override
  List<Object> get props => [];
}

class ProfilePageInitial extends ProfilePageState {}

class UserDetailState extends ProfilePageState {}
