part of 'pwd_auth_provider.dart';

class PwdAuthNotifier extends StateNotifier<PwdAuthState> {
  PwdAuthNotifier(
      {required PwdAuthUsecase pwdAuthUsecase, PwdAuthState? initState})
      : _pwdAuthUsecase = pwdAuthUsecase,
        super(initState ?? const PwdAuthState.initial());

  final PwdAuthUsecase _pwdAuthUsecase;

  void reset() => state = const PwdAuthState.initial();

  Future<void> pwdAuthLogin(PwdParams params) async {
    state = const PwdAuthState.loading();
    final result = await _pwdAuthUsecase.pwdAuthUsecase(params);

    result.fold(
        (failure) => state = PwdAuthState.error(message: failure.toString()),
        (success) => state = PwdAuthState.data(data: success));
  }
}
