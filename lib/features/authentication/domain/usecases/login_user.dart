import 'package:dartz/dartz.dart';
import '../../../../core/dto/login_request.dart';
import '../../../../core/errors/failures.dart';
import '../repository/authentication_repository.dart';
import '../../../../core/usecases/usecases.dart';

class LoginUser implements UseCases<String, LoginRequest> {
  AuthenticationRepository repository;
  LoginUser({required this.repository});

  @override
  Future<Either<Failure, String>> call(LoginRequest loginRequest) async {
    return repository.loginUser(loginRequest: loginRequest);
  }
}

// class LoginParams {
//   String userNameOrPhoneNumber, password;

//   LoginParams({
//     required this.userNameOrPhoneNumber,
//     required this.password,
//   });
// }
