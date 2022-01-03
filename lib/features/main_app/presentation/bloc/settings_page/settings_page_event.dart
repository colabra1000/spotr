part of 'settings_page_bloc.dart';

abstract class SettingsPageEvent extends Equatable {
  const SettingsPageEvent();

  @override
  List<Object> get props => [];
}

class InitializeSettingsEvent extends SettingsPageEvent {}

class NavigateToUpdateUsernamePageEvent extends SettingsPageEvent {}

class NavigateToUpdatePasswordPageEvent extends SettingsPageEvent {}

class NavigateToUpdateEmailPageEvent extends SettingsPageEvent {}

class UpdateUserInfoEvent extends SettingsPageEvent {
  final SettingsType settingsType;
  final String fieldValue;

  const UpdateUserInfoEvent(
      {required this.settingsType, required this.fieldValue});
  @override
  List<Object> get props => [settingsType, fieldValue];
}
