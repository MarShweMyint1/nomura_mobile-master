// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElementList _$ElementListFromJson(Map<String, dynamic> json) => ElementList(
      name: json['name'] as String?,
      type: json['type'] as String?,
      optional: json['optional'] as String?,
      label: json['label'] as String?,
      maxlength: json['max-length'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ElementListToJson(ElementList instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'optional': instance.optional,
      'label': instance.label,
      'max-length': instance.maxlength,
      'value': instance.value,
    };
