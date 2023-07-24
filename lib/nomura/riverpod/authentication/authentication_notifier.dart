part of 'authentication_provider.dart';

class AuthenticationNotifier extends StateNotifier<AuthenticationState> {
  AuthenticationNotifier(
      {required AuthenticateUseCase authenticateUseCase,
      AuthenticationState? initState})
      : _authenticateUseCase = authenticateUseCase,
        super(initState ?? const AuthenticationState.initial());

  final AuthenticateUseCase _authenticateUseCase;

  void reset() => state = const AuthenticationState.initial();

  Future<void> authentication({
    required String username,
    required SessionProvider? sessionProvider,
    required OperationType operationType,
    required WidgetRef ref,
    // bool isForgetPin=false
    required AuthType authType,
  }) async {
    state = const AuthenticationState.loading();
    var exception = await SaveLocal().getException();
    print("working 3=>$exception");
    await _authenticateUseCase.execute(
      username: username,
      sessionProvider: sessionProvider,
      operationType: operationType,
      ref: ref,
      authType: authType,
    );
    if (exception != null) {
      state = const AuthenticationState.error();
    }
  }
}
