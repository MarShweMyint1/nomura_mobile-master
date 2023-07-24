part of 'pin_verify_provider.dart';

class PinVerifyNotifier extends StateNotifier<PinVerifyState> {
  PinVerifyNotifier(
      {required VerifyPinUseCase verifyPinUseCase, PinVerifyState? initState})
      : _verifyPinUseCase = verifyPinUseCase,
        super(initState ?? const PinVerifyState.initial());

  final VerifyPinUseCase _verifyPinUseCase;

  void reset() => state = const PinVerifyState.initial();

  Future<void> setUpPinVerify(String pin) async {
    state = const PinVerifyState.loading();
    var exception = await SaveLocal().getException();
    await _verifyPinUseCase.execute(pin);
    // if (exception != null) {
    //   state = PinVerifyState.error(message: exception);
    // } else {
    //   state = const PinVerifyState.data();
    // }
  }
}
