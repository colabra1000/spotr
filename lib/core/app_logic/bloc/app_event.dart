part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends Equatable {}

class BeginInitialize extends AppEvent {
  BeginInitialize() : super();
  @override
  List<Object?> get props => [];
}
