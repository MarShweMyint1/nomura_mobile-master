// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => TokenModel(
      json['access_token'] as String?,
      json['id_token'] as String?,
      json['token_type'] as String?,
      json['expires_in'] as int?,
    );

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'id_token': instance.id_token,
      'token_type': instance.token_type,
      'expires_in': instance.expires_in,
    };
