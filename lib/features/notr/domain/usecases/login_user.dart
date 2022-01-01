import 'package:dartz/dartz.dart';
import 'package:spotr/core/dto/login_request.dart';
import 'package:spotr/core/errors/failures.dart';
import 'package:spotr/features/notr/domain/repository/authentication_repository.dart';
import 'package:spotr/features/notr/domain/usecases/usecases.dart';

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
