part of 'pin_entry_provider.dart';

class PinEntryNotifier extends StateNotifier<PinEntryState> {
  PinEntryNotifier(
      {required SetPinUseCase setPinUseCase, PinEntryState? initState})
      : _setPinUseCase = setPinUseCase,
        super(initState ?? const PinEntryState.initial());

  final SetPinUseCase _setPinUseCase;

  void reset() => state = const PinEntryState.initial();

  Future<void> setUpPinEntry(String firstCredentials) async {
    state = const PinEntryState.loading();
    var exception = await SaveLocal().getException();
    await _setPinUseCase.execute(firstCredentials);
    // if (exception != null) {
    //   state = PinEntryState.error(message: exception);
    // } else {
    //   state = const PinEntryState.data();
    // }
  }
}
