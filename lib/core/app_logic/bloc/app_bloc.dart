import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) async {
      if (event is BeginInitialize) {
        //delay 2 seconds
        await Future.delayed(const Duration(seconds: 2));
        emit(InitializationComplete());
      }
    });

    add(BeginInitialize());
  }
}
