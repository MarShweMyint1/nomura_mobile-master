// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:json_annotation/json_annotation.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/configuration/model/login_configuration.dart';

part 'app_configuration.g.dart';

@JsonSerializable()
class AppConfiguration {
  @JsonKey(name: "login")
  LoginConfiguration loginConfiguration;

  @JsonKey(name: "sdk")
  Configuration sdkConfiguration;

  @JsonKey(name: 'changeSdk')
  Configuration sdkChangeConfiguration;
  @JsonKey(name: "sdkconfig2")
  Configuration sdkConfiguration2;

  AppConfiguration({
    required this.loginConfiguration,
    required this.sdkConfiguration,
    required this.sdkChangeConfiguration,
    required this.sdkConfiguration2,
  });

  factory AppConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AppConfigurationFromJson(json);

  AppConfiguration fromJson(Map<String, dynamic> json) =>
      AppConfiguration.fromJson(json);

  Map<String, dynamic> toJson() => _$AppConfigurationToJson(this);
}
