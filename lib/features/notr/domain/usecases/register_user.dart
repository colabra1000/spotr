import 'package:dartz/dartz.dart';
import 'package:spotr/core/dto/register_request.dart';
import 'package:spotr/core/errors/failures.dart';
import 'package:spotr/features/notr/domain/repository/authentication_repository.dart';
import 'package:spotr/features/notr/domain/usecases/usecases.dart';

class RegisterUser implements UseCases<String, RegisterRequest> {
  AuthenticationRepository repository;
  RegisterUser({required this.repository});

  @override
  Future<Either<Failure, String>> call(RegisterRequest registerRequest) async {
    return repository.registerUser(registerRequest: registerRequest);
  }
}

// class UserRegistrationParams {
//   String userName, email, phoneNumber, password;
//   List interests;

//   UserRegistrationParams({
//     required this.userName,
//     required this.email,
//     required this.phoneNumber,
//     required this.password,
//     required this.interests,
//   });
// }
