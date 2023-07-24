part of 'mobile_client_auth_provider.dart';

class MobileClientAuthNotifier extends StateNotifier<MobileClientAuthState> {
  MobileClientAuthNotifier(
      {required MobileClientAuthUsecase mobileClientAuthUsecase,
      MobileClientAuthState? initState})
      : _mobileClientAuthUsecase = mobileClientAuthUsecase,
        super(initState ?? const MobileClientAuthState.initial());

  final MobileClientAuthUsecase _mobileClientAuthUsecase;
  void reset() => state = const MobileClientAuthState.initial();
  Future<void> mobileClientAuthFunc(
      MobileClientAuthParam params, WidgetRef ref) async {
    state = const MobileClientAuthState.loading();

    final result = await _mobileClientAuthUsecase.mobileClientAuth(params, ref);
    debugPrint('result runtime=====>${result.runtimeType}');
    result.fold(
        (failure) =>
            state = MobileClientAuthState.error(message: failure.toString()),
        (success) {
      debugPrint('success runtime =================>>${success.runtimeType}');
      state = MobileClientAuthState.data(data: success);
    });
  }
}
