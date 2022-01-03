import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class UserInfo extends Equatable {
  final String email;
  final List interests;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'full_name')
  final String fullName;
  final String username;
  final bool verified;

  UserInfo.empty()
      : fullName = "",
        email = "",
        interests = [],
        phoneNumber = "",
        username = "",
        verified = false;

  const UserInfo({
    required this.fullName,
    required this.email,
    required this.interests,
    required this.phoneNumber,
    required this.username,
    required this.verified,
  });

  @override
  List<Object?> get props =>
      [email, interests, phoneNumber, username, verified];
}
