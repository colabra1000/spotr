// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      email: json['email'],
      interests: json['interests'],
      phoneNumber: json['phone_number'],
      username: json['username'],
      verified: json['verified'],
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'interests': instance.interests,
      'phone_number': instance.phoneNumber,
      'username': instance.username,
      'verified': instance.verified,
    };
