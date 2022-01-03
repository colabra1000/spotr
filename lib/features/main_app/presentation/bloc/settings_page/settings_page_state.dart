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

class SettingsPageError extends SettingsPageState {
  final String errorMessage;
  const SettingsPageError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class SettingsPageAlert extends SettingsPageState {
  final String alertMessage;
  const SettingsPageAlert({required this.alertMessage});
  @override
  List<Object> get props => [alertMessage];
}

class SettingsPageInitial extends SettingsPageState {}

enum SettingsType {
  initial,
  updateUsername,
  updatePassword,
  updateEmail,
}
