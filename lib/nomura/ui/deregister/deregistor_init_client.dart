import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/usecases/deregister_all_usecase.dart';

Future<void> deregisterationMobileAuthenticationClient({
  required Configuration sdkConfiguration,
  required AuthorizationProvider authorizationProvider,
  required String username,
  required WidgetRef ref,
}) async {
  return await MobileAuthenticationClientInitializer.initializer()
      .configuration(sdkConfiguration)
      .onSuccess((client) async {
    debugPrint('Client deregisteration initialization succeeded.');

    GetIt.I.unregister<MobileAuthenticationClient>();
    GetIt.I.registerSingleton<MobileAuthenticationClient>(client);
    //! Deregistration for USER_DECIDE_REMOVE_DEVICE

    DeregisterAllUseCase deregisterUseCase = GetIt.I<DeregisterAllUseCase>();
    debugPrint("DEREG ==>> $deregisterUseCase");
    await deregisterUseCase
        .execute(
      username: username,
      authorizationProvider: authorizationProvider,
    )
        .catchError((error) {
      debugPrint("Deregister ERROR :-( ====>>> $error");
    });
  }).onError((error) {
    debugPrint('Client initialization failed: ${error.runtimeType}.');
  }).execute();
}
