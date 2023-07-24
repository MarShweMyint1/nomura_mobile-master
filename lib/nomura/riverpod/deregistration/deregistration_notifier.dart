part of 'deregistration_provider.dart';

class DeregistrationNotifier extends StateNotifier<DeregistrationState> {
  DeregistrationNotifier(
      {required DeregisterUseCase deregisterUseCase,
      DeregistrationState? initState})
      : _deregisterUseCase = deregisterUseCase,
        super(initState ?? const DeregistrationState.initial());

  final DeregisterUseCase _deregisterUseCase;

  void reset() => state = const DeregistrationState.initial();

  Future<void> deregistration(
      {required String username,
      required AuthorizationProvider authorizationProvider,
      required WidgetRef ref}) async {
    state = const DeregistrationState.loading();
    var exception = await SaveLocal().getException();
    await _deregisterUseCase.execute(
        username: username,
        authorizationProvider: authorizationProvider,
        ref: ref);
    // if (exception != null) {
    //   state = DeregistrationState.error(message: exception);
    // } else {
    //   state = const DeregistrationState.data();
    // }
  }
}
