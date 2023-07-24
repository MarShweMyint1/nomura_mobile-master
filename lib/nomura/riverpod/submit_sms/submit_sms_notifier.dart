part of 'submit_sms_provider.dart';

class SubmitSMSNotifier extends StateNotifier<SubmitSMSState> {
  SubmitSMSNotifier(
      {required SubmitSMSUsecase submitSMSUsecase, SubmitSMSState? initState})
      : _submitSMSUsecase = submitSMSUsecase,
        super(initState ?? const SubmitSMSState.initial());

  final SubmitSMSUsecase _submitSMSUsecase;

  void reset() => state = const SubmitSMSState.initial();

  Future<void> submittedSMS(SubmitSMSParams params, WidgetRef ref) async {
    state = const SubmitSMSState.loading();
    final result = await _submitSMSUsecase.submitSMS(params, ref);

    result.fold(
        (failure) => state = SubmitSMSState.error(message: failure.toString()),
        (success) {
      if (success.runtimeType == LegacyProceedModel) {
        state = SubmitSMSState.invalid(invalidData: success);
      } else {
        if (success.code == "MTAN_LOCK") {
          state = SubmitSMSState.lock(lock: success);
        } else {
          state = SubmitSMSState.data(data: success);
        }
      }
    });
  }
}
