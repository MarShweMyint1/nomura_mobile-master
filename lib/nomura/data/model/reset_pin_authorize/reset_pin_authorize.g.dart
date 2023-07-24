// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_pin_authorize.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPinAuthorizeModel _$ResetPinAuthorizeModelFromJson(
        Map<String, dynamic> json) =>
    ResetPinAuthorizeModel(
      (json['trustedFacets'] as List<dynamic>?)
          ?.map((e) => TrustedFacets.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResetPinAuthorizeModelToJson(
        ResetPinAuthorizeModel instance) =>
    <String, dynamic>{
      'trustedFacets': instance.trustedFacets,
    };
