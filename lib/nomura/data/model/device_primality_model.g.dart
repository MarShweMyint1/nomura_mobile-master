// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_primality_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DevicePrimalityModel _$DevicePrimalityModelFromJson(
        Map<String, dynamic> json) =>
    DevicePrimalityModel(
      (json['dispatchTargets'] as List<dynamic>?)
          ?.map((e) => DispatchTargets.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DevicePrimalityModelToJson(
        DevicePrimalityModel instance) =>
    <String, dynamic>{
      'dispatchTargets': instance.dispatchTargets,
    };
