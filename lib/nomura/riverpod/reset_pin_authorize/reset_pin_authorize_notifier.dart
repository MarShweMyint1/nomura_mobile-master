part of 'reset_pin_authorize_provider.dart';

class ResetPinAuthorizeNotifier extends StateNotifier<ResetPinAuthorizeState> {
  ResetPinAuthorizeNotifier(
      {required ResetPinAuthorizeUsecase resetPinAuthorizeUsecase, ResetPinAuthorizeState? initState})
      : _authorizeUsecase = resetPinAuthorizeUsecase,
        super(initState ?? const ResetPinAuthorizeState.initial());

  final ResetPinAuthorizeUsecase _authorizeUsecase;

  void reset() => state = const ResetPinAuthorizeState.initial();

  Future<void> resetPinAuthorizeFunc(String cookie,WidgetRef ref) async {
    state = const ResetPinAuthorizeState.loading();
    final result = await _authorizeUsecase.resetPinAuthorize(cookie,ref);

    result.fold((failure) {
      state = ResetPinAuthorizeState.error(error: failure.toString());
    }, (success) {
      if (success.runtimeType == ResetPinAuthorizeModel) {
        state = ResetPinAuthorizeState.data(data: success);
      } else if(success.runtimeType == LegacyLoginModel){
        state = ResetPinAuthorizeState.unauthorize(data: success);
      }
    });
  }
}
