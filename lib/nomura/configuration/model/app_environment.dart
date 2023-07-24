// Copyright © 2022 Nevis Security AG. All rights reserved.

enum AppEnvironment {
  authenticationCloud,
  identitySuite,
}

extension AppEnvironmentExtension on AppEnvironment {
  String get configFileName {
    return 'config_identity_suite.json';
  }
}
