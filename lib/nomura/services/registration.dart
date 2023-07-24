import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';

Future<void> authCloudApiRegistration({
  required MobileAuthenticationClient client,
  required String enrollResponse,
  required DeviceInformation deviceInformation,
  required AuthenticatorSelector authenticatorSelector,
  required PinEnroller pinEnroller,
  required BiometricUserVerifier biometricUserVerifier,
  required FingerprintUserVerifier fingerprintUserVerifier,
}) async {
  await client.operations.authCloudApiRegistration
      .enrollResponse(enrollResponse)
      .deviceInformation(deviceInformation)
      .authenticatorSelector(authenticatorSelector)
      .pinEnroller(pinEnroller)
      .biometricUserVerifier(biometricUserVerifier)
      .fingerprintUserVerifier(fingerprintUserVerifier)
      .onSuccess(() {
    // handle success
  }).onError((error) {
    // handle operation error
  }).execute();
}
