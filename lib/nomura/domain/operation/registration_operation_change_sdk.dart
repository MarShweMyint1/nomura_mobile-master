import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/configuration/model/app_configuration.dart';
import 'package:nomura_mobile/nomura/domain/operation/change_sdk_init_client.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/utils/url_utils.dart';

registrationOperationChangeSdk(
    {required String username,
    required List<Cookie> cookiesList,
    required WidgetRef ref,
    required String cookieEndPoint,
    required bool isBiometric}) async {
  const configFile = 'config_identity_suite.json';
  final jsonString = await rootBundle.loadString('assets/config/$configFile');
  final dynamic jsonMap = jsonDecode(jsonString);
  AppConfiguration configuration = AppConfiguration.fromJson(jsonMap);
  var cookies = cookiesList;
  debugPrint('cookies list in regOp==>$cookies');
  if (cookies.isNotEmpty) {
    final List<CookieContainer> containers = cookies
        .map((cookie) => CookieContainer(
              uri: Uri.parse('${UrlUtils.prodUrl}/$cookieEndPoint'),
              cookie: cookie.toString(),
            ))
        .toList();
    debugPrint('containers list in regOp==>${containers.first.cookie}');

    AuthorizationProvider authorizationProvider =
        CookieAuthorizationProvider(cookieContainers: containers);
    ref
        .read(authorizationStorageProvider.notifier)
        .saveAuthProvider(authorizationProvider);
    debugPrint('username in regop==>$username');
    initializeChangeSdkMobileClient(
        sdkConfiguration: configuration.sdkChangeConfiguration,
        authorizationProvider: authorizationProvider,
        username: username,
        ref: ref,
        isBiometric: isBiometric);
  }
}
