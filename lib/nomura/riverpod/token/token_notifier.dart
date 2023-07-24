part of 'token_provider.dart';

class TokenNotifier extends StateNotifier<TokenState> {
  TokenNotifier({required TokenUsecase tokenUsecase, TokenState? initState})
      : _tokenUsecase = tokenUsecase,
        super(initState ?? const TokenState.initial());

  final TokenUsecase _tokenUsecase;
  void reset() => state = const TokenState.initial();
  Future<void> tokenFunc(TokenParam params) async {
    state = const TokenState.loading();
    final result = await _tokenUsecase.token((params));
    result.fold(
        (failure) => state = TokenState.error(message: failure.toString()),
        (success) => state = TokenState.data(data: success));
  }
}
