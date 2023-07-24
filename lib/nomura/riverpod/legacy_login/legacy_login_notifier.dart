part of 'legacy_login_provider.dart';

class LegacyNotifier extends StateNotifier<LegacyState> {
  LegacyNotifier(
      {required LegacyLoginUsecase legacyLoginUsecase, LegacyState? initState})
      : _legacyLoginUsecase = legacyLoginUsecase,
        super(initState ?? const LegacyState.initial());

  final LegacyLoginUsecase _legacyLoginUsecase;

  void reset() => state = const LegacyState.initial();
  LegacyLoginModel _data = LegacyLoginModel();
  LegacyLoginModel get userData => _data;

  Future<void> legacyLoginFunc(ValidateUserParams params) async {
    state = const LegacyState.loading();
    final result = await _legacyLoginUsecase.legacyLogin(params);

    result.fold(
        (failure) => state = LegacyState.error(message: failure.toString()),
        (success) {
      _data = success;
      if (success.code == "MTAN_LOCK") {
        state = LegacyState.lock(data: success);
      } else {
        state = LegacyState.data(data: success);
      }
    });
  }
}
