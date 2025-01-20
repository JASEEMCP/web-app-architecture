// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      refreshToken: json['refresh_token'] as String?,
      accessToken: json['access_token'] as String?,
      name: json['name'] as String?,
      isProfileCreated: json['is_profile_created'] as bool?,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'refresh_token': instance.refreshToken,
      'access_token': instance.accessToken,
      'is_profile_created': instance.isProfileCreated,
      'name': instance.name,
    };
