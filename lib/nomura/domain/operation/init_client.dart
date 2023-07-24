import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/domain/usecases/deregister_usecase.dart';
import 'package:nomura_mobile/nomura/domain/usecases/registration_usecase.dart';
import 'package:nomura_mobile/nomura/utils/constant_utils.dart';

Future<void> initializeMobileAuthenticationClient({
  required Configuration sdkConfiguration,
  required AuthorizationProvider authorizationProvider,
  required String username,
  required WidgetRef ref,
}) async {
  return await MobileAuthenticationClientInitializer.initializer()
      .configuration(sdkConfiguration)
      .onSuccess((client) async {
    debugPrint('Client initialization succeeded.');
    GetIt.I.allowReassignment = true;
    GetIt.I.registerSingleton<MobileAuthenticationClient>(client);
    var deregister = await SaveLocal().getDeregister();
    debugPrint("DEREGISTER ====>>>> $deregister");

    if (deregister == true) {
      DeregisterUseCase deregisterUseCase = GetIt.I<DeregisterUseCase>();
      await deregisterUseCase
          .execute(
              username: username,
              authorizationProvider: authorizationProvider,
              ref: ref)
          .catchError((error) {
        debugPrint("Deregister ERROR :-( ====>>> $error");
      });
      debugPrint("Deregistration Successed :-) ====>>>");
    } else {
      RegistrationUseCase registrationUseCase = GetIt.I<RegistrationUseCase>();
      await registrationUseCase.execute(
        username: username,
        authorizationProvider: authorizationProvider,
        ref: ref,
        aaid: isIOS ? "F1D0#1001" : "F1D0#0001",
      );
    }
  }).onError((error) {
    debugPrint('Client initialization failed: ${error.runtimeType}.');
  }).execute();
}
