part of 'settings_page_bloc.dart';

abstract class SettingsPageEvent extends Equatable {
  const SettingsPageEvent();

  @override
  List<Object> get props => [];
}

class InitializeSettingsEvent extends SettingsPageEvent {}

class UpdateUsernameEvent extends SettingsPageEvent {}

class UpdatePasswordEvent extends SettingsPageEvent {}

class UpdateEmailEvent extends SettingsPageEvent {}
