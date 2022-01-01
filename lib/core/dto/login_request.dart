import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  String usernameOrPhoneNumber;
  String password;

  LoginRequest({
    required this.usernameOrPhoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
