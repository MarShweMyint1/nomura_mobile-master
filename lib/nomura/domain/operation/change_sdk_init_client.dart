import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/domain/usecases/deregister_usecase.dart';
import 'package:nomura_mobile/nomura/domain/usecases/registration_operation_change_sdk_usecase.dart';
import 'package:nomura_mobile/nomura/utils/constant_utils.dart';

Future<void> initializeChangeSdkMobileClient(
    {required Configuration sdkConfiguration,
    required AuthorizationProvider authorizationProvider,
    required String username,
    required WidgetRef ref,
    required bool isBiometric}) async {
  return await MobileAuthenticationClientInitializer.initializer()
      .configuration(sdkConfiguration)
      .onSuccess((client) async {
    debugPrint('Client initialization succeeded.');

    // GetIt.I.unregister<MobileAuthenticationClient>();
    GetIt.I.allowReassignment = true;
    GetIt.I.registerSingleton<MobileAuthenticationClient>(client);
    //! Deregistration for USER_DECIDE_REMOVE_DEVICE
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
      RegistrationOpChangeSdkUseCase registrationUseCase =
          GetIt.I<RegistrationOpChangeSdkUseCase>();
      await registrationUseCase.execute(
        username: username,
        authorizationProvider: authorizationProvider,
        ref: ref,
        aaid: (isBiometric)
            ? isIOS
                ? "F1D0#1003"
                : "F1D0#0003"
            : isIOS
                ? "F1D0#1002"
                : "F1D0#0002",
      );
    }
  }).onError((error) {
    debugPrint('Client initialization failed: ${error.runtimeType}.');
  }).execute();
}
