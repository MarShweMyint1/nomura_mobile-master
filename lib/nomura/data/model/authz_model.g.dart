// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthzModel _$AuthzModelFromJson(Map<String, dynamic> json) => AuthzModel(
      code: json['code'] as String?,
      verifier: json['verifier'] as String?,
    );

Map<String, dynamic> _$AuthzModelToJson(AuthzModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'verifier': instance.verifier,
    };
