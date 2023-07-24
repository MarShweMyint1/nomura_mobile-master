import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/configuration/model/app_configuration.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/domain/usecases/forget_pin_authenticate_usecase.dart';
import 'package:nomura_mobile/nomura/utils/enumeration.dart';

Future<void> forgotPinClient({
  required WidgetRef ref,
  required BuildContext context,
}) async {
  String username = await SaveLocal().getUserid();
  const configFile = 'config_identity_suite.json';
  final jsonString = await rootBundle.loadString('assets/config/$configFile');
  final dynamic jsonMap = jsonDecode(jsonString);
  AppConfiguration configuration = AppConfiguration.fromJson(jsonMap);
  return await MobileAuthenticationClientInitializer.initializer()
      .configuration(configuration.sdkConfiguration2)
      .onSuccess((client) async {
    debugPrint('Forgot Client initialization succeeded.');
    ForgetPinAuthenticateUseCase forgetPinAuthenticateUseCase =
        GetIt.I<ForgetPinAuthenticateUseCase>();
    await forgetPinAuthenticateUseCase.execute(
        username: username,
        sessionProvider: null,
        operationType: OperationType.authentication,
        ref: ref,
        authType: AuthType.forgetPIn);
  }).onError((error) {
    debugPrint('LoginClient initialization failed: ${error.runtimeType}.');
  }).execute();
}
