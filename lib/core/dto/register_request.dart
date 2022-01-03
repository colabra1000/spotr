import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  String username;
  String email;
  @JsonKey(name: "phone_number")
  String phoneNumber;
  @JsonKey(name: "full_name")
  String fullName;
  List interests;
  String password;
  bool verified;

  RegisterRequest({
    required this.fullName,
    required this.password,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.interests,
    this.verified = false,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
