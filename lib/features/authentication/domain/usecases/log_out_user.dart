import 'package:dartz/dartz.dart';
import '../../../../core/dto/login_request.dart';
import '../../../../core/errors/failures.dart';
import '../repository/authentication_repository.dart';
import '../../../../core/usecases/usecases.dart';

class LogOutUser implements UseCases<String, dynamic> {
  AuthenticationRepository repository;
  LogOutUser({required this.repository});

  @override
  Future<Either<Failure, String>> call(dynamic) async {
    return repository.logOutUser();
  }
}

// class LoginParams {
//   String userNameOrPhoneNumber, password;

//   LoginParams({
//     required this.userNameOrPhoneNumber,
//     required this.password,
//   });
// }
