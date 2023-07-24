part of 'resend_mail_provider.dart';

class ResendMailNotifier extends StateNotifier<ResendMailState> {
  ResendMailNotifier(
      {required ResendMailUsecase resendMailUsecase,
      ResendMailState? initState})
      : _resendMailUsecase = resendMailUsecase,
        super(initState ?? const ResendMailState.initial());

  final ResendMailUsecase _resendMailUsecase;

  void reset() => state = const ResendMailState.initial();

  Future<void> resendMailFunc(ResendSMSParams params) async {
    state = const ResendMailState.loading();
    final result = await _resendMailUsecase.resendMail(params);

    result.fold((failure) {
      state = ResendMailState.error(message: failure.toString());
    }, (success) {
      state = ResendMailState.data(data: success);
    });
  }
}
