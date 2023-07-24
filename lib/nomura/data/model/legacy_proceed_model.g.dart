// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legacy_proceed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LegacyProceedModel _$LegacyProceedModelFromJson(Map<String, dynamic> json) =>
    LegacyProceedModel(
      name: json['name'] as String?,
      target: json['target'] as String?,
      label: json['label'] as String?,
      domain: json['domain'] as String?,
      elements: (json['elements'] as List<dynamic>?)
          ?.map((e) => ElementList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LegacyProceedModelToJson(LegacyProceedModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'target': instance.target,
      'label': instance.label,
      'domain': instance.domain,
      'elements': instance.elements,
    };
