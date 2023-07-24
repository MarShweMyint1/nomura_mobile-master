part of 'pin_change_provider.dart';

class PinChangeNotifier extends StateNotifier<PinChangeState> {
  PinChangeNotifier(
      {required ChangePinUseCase changePinUseCase, PinChangeState? initState})
      : _changePinUseCase = changePinUseCase,
        super(initState ?? const PinChangeState.initial());

  final ChangePinUseCase _changePinUseCase;

  void reset() => state = const PinChangeState.initial();

  Future<void> pinChangeNotifier(
    String username,
    WidgetRef ref,
  ) async {
    state = const PinChangeState.loading();
    var exception = await SaveLocal().getException();
    await _changePinUseCase.execute(username: username, ref: ref);
    // if (exception != null) {
    //   state = PinChangeState.error(message: exception);
    // } else {
    //   state = const PinChangeState.data();
    // }
  }
}
