// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:spotr/features/authentication/domain/entities/user_info.dart';

// part 'profile_page_event.dart';
// part 'profile_page_state.dart';

// class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
//   ProfilePageBloc() : super(ProfilePageInitial()) {
//     on<ProfilePageEvent>((event, emit) {
//       if (event is UpdateUserDetailEvent) {
//         print("nule " + event.userInfo.toString());

//         emit(NewUserDetailState(userInfo: event.userInfo));
//       }
//     });
//   }
// }
