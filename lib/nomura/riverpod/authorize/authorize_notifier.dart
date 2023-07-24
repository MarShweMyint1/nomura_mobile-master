part of 'authorize_provider.dart';

class AuthorizeNotifier extends StateNotifier<AuthorizeState> {
  AuthorizeNotifier(
      {required AuthorizeUsecase authorizeUsecase, AuthorizeState? initState})
      : _authorizeUsecase = authorizeUsecase,
        super(initState ?? const AuthorizeState.initial());

  final AuthorizeUsecase _authorizeUsecase;

  void reset() => state = const AuthorizeState.initial();

  Future<void> authorize(WidgetRef ref) async {
    state = const AuthorizeState.loading();
    final result = await _authorizeUsecase.authorize(ref);

    result.fold(
        (failure) => state = AuthorizeState.error(message: failure.toString()),
        (success) => state = AuthorizeState.data(
            isTrusted: success.runtimeType == List<dynamic>));
  }
}
