part of 'settings_page_bloc.dart';

abstract class SettingsPageState extends Equatable {
  const SettingsPageState();

  @override
  List<Object> get props => [];
}

class SettingsPageWorking extends SettingsPageState {}

class SettingsPageIdle extends SettingsPageState {
  final SettingsType settingsType;
  final String fieldValue;

  const SettingsPageIdle(
      {required this.settingsType, required this.fieldValue});
  @override
  List<Object> get props => [settingsType, fieldValue];
}

class SettingsPageError extends SettingsPageState {}

class SettingsPageAlert extends SettingsPageState {}

class SettingsPageInitial extends SettingsPageState {}

enum SettingsType {
  initial,
  updateUsername,
  updatePassword,
  updateEmail,
}
