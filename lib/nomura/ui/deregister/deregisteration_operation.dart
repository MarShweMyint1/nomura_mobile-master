import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/configuration/model/app_configuration.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/ui/deregister/deregistor_init_client.dart';

deregistrationOperation(String username, WidgetRef ref) async {
  const configFile = 'config_identity_suite.json';
  final jsonString = await rootBundle.loadString('assets/config/$configFile');
  final dynamic jsonMap = jsonDecode(jsonString);
  AppConfiguration configuration = AppConfiguration.fromJson(jsonMap);

  var authProvider = ref.watch(authorizationStorageProvider);
  AuthorizationProvider authorizationProvider = authProvider;

  deregisterationMobileAuthenticationClient(
    sdkConfiguration: configuration.sdkConfiguration2,
    authorizationProvider: authorizationProvider,
    username: username,
    ref: ref,
  );
}
