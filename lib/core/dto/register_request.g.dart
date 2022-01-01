// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      password: json['password'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      interests: json['interests'] as List<dynamic>,
      verified: json['verified'] as bool? ?? false,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'interests': instance.interests,
      'password': instance.password,
      'verified': instance.verified,
    };
