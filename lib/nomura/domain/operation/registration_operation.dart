import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/configuration/model/app_configuration.dart';
import 'package:nomura_mobile/nomura/domain/operation/init_client.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/utils/url_utils.dart';

registrationOperation(String username, List<Cookie> cookiesList, WidgetRef ref,
    String cookieEndPoint) async {
  const configFile = 'config_identity_suite.json';
  final jsonString = await rootBundle.loadString('assets/config/$configFile');
  final dynamic jsonMap = jsonDecode(jsonString);
  AppConfiguration configuration = AppConfiguration.fromJson(jsonMap);
  var cookies = cookiesList;
  if (cookies.isNotEmpty) {
    final List<CookieContainer> containers = cookies
        .map((cookie) => CookieContainer(
              uri: Uri.parse('${UrlUtils.prodUrl}/$cookieEndPoint'),
              cookie: cookie.toString(),
            ))
        .toList();

    AuthorizationProvider authorizationProvider =
        CookieAuthorizationProvider(cookieContainers: containers);
    ref
        .read(authorizationStorageProvider.notifier)
        .saveAuthProvider(authorizationProvider);
    initializeMobileAuthenticationClient(
      sdkConfiguration: configuration.sdkConfiguration,
      authorizationProvider: authorizationProvider,
      username: username,
      ref: ref,
    );
  }
}
