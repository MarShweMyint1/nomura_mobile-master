import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/configuration/model/app_configuration.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/domain/usecases/deregstration_authenticate_usecase.dart';
import 'package:nomura_mobile/nomura/domain/usecases/device_information_usecase.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';
import 'package:nomura_mobile/nomura/utils/enumeration.dart';

Future<void> deregistrationClient({
  required List dispatchTargets,
  required WidgetRef ref,
  required AuthType authType,
  required BuildContext context,
}) async {
  String username = await SaveLocal().getUserid();
  const configFile = 'config_identity_suite.json';
  final jsonString = await rootBundle.loadString('assets/config/$configFile');
  final dynamic jsonMap = jsonDecode(jsonString);
  AppConfiguration configuration = AppConfiguration.fromJson(jsonMap);
  return await MobileAuthenticationClientInitializer.initializer()
      .configuration(configuration.sdkConfiguration)
      .onSuccess((client) async {
    debugPrint('Login Client initialization succeeded.');

    GetIt.I.allowReassignment = true;
    GetIt.I.registerSingleton<MobileAuthenticationClient>(client);
    DeviceInformationUseCase deviceInformationUseCase =
        GetIt.I<DeviceInformationUseCase>();
    var deviceInformation = await deviceInformationUseCase.execute();
    debugPrint("DEVICE INFO Name ===>> ${deviceInformation?.name}");
    debugPrint(
        'DEVICE INFO ID===>${deviceInformation?.idUsernamePairs.first.identifier}');
    var dID = dispatchTargets
        .where((element) => element.name == deviceInformation?.name);
    if (dispatchTargets.length > 1) {
      // ignore: use_build_context_synchronously
      okDialog(context,
          content:
              'Authentication couldn\'t be processed. Please contact Nomura with username for futher actions.',
          onPressed: () => Navigator.pop(context),
          isSuccess: false);
    } else if (dID.isNotEmpty && dispatchTargets.length == 1) {
      //! Do Primary Device Login
      DeregstrationAuthenticateUsecase deregstrationAuthenticateUsecase =
          GetIt.I<DeregstrationAuthenticateUsecase>();
      await deregstrationAuthenticateUsecase.execute(
          username: username,
          sessionProvider: null,
          operationType: OperationType.authentication,
          ref: ref,
          authType: authType);
      // ref.read(authenticationNotifierProvider.notifier).authentication(
      //     username: username,
      //     sessionProvider: null,
      //     operationType: OperationType.authentication,
      //     ref: ref,
      //     authType: authType);
    } else {
      Navigator.pushReplacementNamed(context, Routes.verifyLoginRoute);
    }
    // }
  }).onError((error) {
    debugPrint('LoginClient initialization failed: ${error.runtimeType}.');
  }).execute();
}
