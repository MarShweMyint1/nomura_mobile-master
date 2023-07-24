// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:nomura_mobile/nomura/configuration/model/app_configuration.dart';
import 'package:nomura_mobile/nomura/configuration/model/app_environment.dart';

const identitySuite = Environment('identitySuite');

abstract class ConfigurationLoader {
  AppEnvironment get environment;
  AppConfiguration? configuration;

  Future<AppConfiguration> load() async {
    if (configuration != null) return Future.value(configuration);

    final configFile = environment.configFileName;
    final jsonString = await rootBundle.loadString('assets/$configFile');
    final dynamic jsonMap = jsonDecode(jsonString);
    configuration = AppConfiguration.fromJson(jsonMap);
    return Future.value(configuration);
  }
}

@identitySuite
@Singleton(as: ConfigurationLoader)
class IdentitySuiteConfigurationLoader extends ConfigurationLoader {
  IdentitySuiteConfigurationLoader();

  @override
  AppEnvironment get environment => AppEnvironment.identitySuite;
}
