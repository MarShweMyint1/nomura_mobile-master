// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legacy_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LegacyLoginModel _$LegacyLoginModelFromJson(Map<String, dynamic> json) =>
    LegacyLoginModel(
      transfarId: json['transfarId'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$LegacyLoginModelToJson(LegacyLoginModel instance) =>
    <String, dynamic>{
      'transfarId': instance.transfarId,
      'code': instance.code,
      'message': instance.message,
      'mobile': instance.mobile,
      'email': instance.email,
    };
