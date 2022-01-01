import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class UserInfo extends Equatable {
  final String email;
  final List interests;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String username;
  final bool verified;

  const UserInfo({
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
