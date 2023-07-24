part of 'biometric_entry_provider.dart';

class BiometricEntryNotifier extends StateNotifier<BiometricEntryState> {
  BiometricEntryNotifier(
      {required BiometricListenForOsCredentialsUseCase
          biometricListenForOsCredentialsUseCase,
      BiometricEntryState? initState})
      : _biometricListenForOsCredentialsUseCase =
            biometricListenForOsCredentialsUseCase,
        super(initState ?? const BiometricEntryState.initial());

  final BiometricListenForOsCredentialsUseCase
      _biometricListenForOsCredentialsUseCase;

  void reset() => state = const BiometricEntryState.initial();

  Future<void> promptBiometricEntry(BiometricPromptOptions options) async {
    state = const BiometricEntryState.loading();
    var exception = await SaveLocal().getException();
    await _biometricListenForOsCredentialsUseCase.execute(options);
    // if (exception != null) {
    //   state = BiometricEntryState.error(message: exception);
    // } else {
    //   state = const BiometricEntryState.data();
    // }
  }
}
