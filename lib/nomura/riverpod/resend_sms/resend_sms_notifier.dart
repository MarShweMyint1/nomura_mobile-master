part of 'resend_sms_provider.dart';

class ResendSMSNotifier extends StateNotifier<ResendSMSState> {
  ResendSMSNotifier(
      {required ResendSMSUsecase resendSMSUsecase, ResendSMSState? initState})
      : _resendSMSUsecase = resendSMSUsecase,
        super(initState ?? const ResendSMSState.initial());

  final ResendSMSUsecase _resendSMSUsecase;

  void reset() => state = const ResendSMSState.initial();

  Future<void> resendSMSFunc(ResendSMSParams params) async {
    state = const ResendSMSState.loading();
    final result = await _resendSMSUsecase.resendSMS(params);

    result.fold((failure) {
      state = ResendSMSState.error(message: failure.toString());
    }, (success) {
      if (success.runtimeType == LegacyLoginModel) {
        state = ResendSMSState.notFound(invalidData: success);
      } else {
        state = ResendSMSState.data(data: success);
      }
    });
  }
}
