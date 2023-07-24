part of 'registration_provider.dart';

class RegistrationNotifier extends StateNotifier<RegistrationState> {
  RegistrationNotifier(
      {required RegistrationUseCase registrationUseCase,
      RegistrationState? initState})
      : _registrationUseCase = registrationUseCase,
        super(initState ?? const RegistrationState.initial());

  final RegistrationUseCase _registrationUseCase;

  void reset() => state = const RegistrationState.initial();

  Future<void> registration({
    required String username,
    required AuthorizationProvider? authorizationProvider,
    required WidgetRef ref,
    required String aaid,
  }) async {
    var exception = await SaveLocal().getException();
    state = const RegistrationState.loading();

    await _registrationUseCase.execute(
      username: username,
      authorizationProvider: authorizationProvider,
      ref: ref,
      aaid: aaid,
    );

    if (exception != null) {
      state = const RegistrationState.error();
    }
  }
}
