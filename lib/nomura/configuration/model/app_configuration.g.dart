// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfiguration _$AppConfigurationFromJson(Map<String, dynamic> json) =>
    AppConfiguration(
      loginConfiguration:
          LoginConfiguration.fromJson(json['login'] as Map<String, dynamic>),
      sdkConfiguration:
          Configuration.fromJson(json['sdk'] as Map<String, dynamic>),
      sdkChangeConfiguration:
          Configuration.fromJson(json['changeSdk'] as Map<String, dynamic>),
      sdkConfiguration2:
          Configuration.fromJson(json['sdkconfig2'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppConfigurationToJson(AppConfiguration instance) =>
    <String, dynamic>{
      'login': instance.loginConfiguration,
      'sdk': instance.sdkConfiguration,
      'changeSdk': instance.sdkChangeConfiguration,
      'sdkconfig2': instance.sdkConfiguration2,
    };
