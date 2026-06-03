// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  coinCount: (json['coinCount'] as num?)?.toInt(),
  email: json['email'] as String?,
  nickname: json['nickname'] as String?,
  password: json['password'] as String?,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'coinCount': instance.coinCount,
  'email': instance.email,
  'nickname': instance.nickname,
  'password': instance.password,
};
