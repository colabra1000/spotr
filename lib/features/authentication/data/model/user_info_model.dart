import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user_info.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel extends UserInfo {
  const UserInfoModel({
    required email,
    required interests,
    required phoneNumber,
    required username,
    required fullName,
    required verified,
  }) : super(
          fullName: fullName,
          email: email,
          interests: interests,
          phoneNumber: phoneNumber,
          username: username,
          verified: verified,
        );

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}
