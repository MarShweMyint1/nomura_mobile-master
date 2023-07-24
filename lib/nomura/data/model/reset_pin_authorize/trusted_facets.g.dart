// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trusted_facets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrustedFacets _$TrustedFacetsFromJson(Map<String, dynamic> json) =>
    TrustedFacets(
      json['version'] == null
          ? null
          : Version.fromJson(json['version'] as Map<String, dynamic>),
      (json['ids'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TrustedFacetsToJson(TrustedFacets instance) =>
    <String, dynamic>{
      'version': instance.version,
      'ids': instance.ids,
    };
