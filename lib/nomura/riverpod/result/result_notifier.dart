part of 'result_provider.dart';

class ResultNotifier extends StateNotifier<ResultState> {
  ResultNotifier({ResultState? initState})
      : super(initState ?? const ResultState.initial());

  void reset() => state = const ResultState.initial();

  void onSuccess(String aaid, OperationType authType) {
    state = const ResultState.loading();
    if (authType == OperationType.registration) {
      print("Result Registration AAID=>$aaid");
      if (aaid == (isIOS ? "F1D0#1001" : "F1D0#0001")) {
        state = const ResultState.pinResult();
      } else if (aaid == (isIOS ? "F1D0#1003" : "F1D0#0003")) {
        state = const ResultState.biometricResult();
      } else if (aaid == (isIOS ? "F1D0#1002" : "F1D0#0002")) {
        state = const ResultState.fingerprintResult();
      }
    } else if (authType == OperationType.forgotPin) {
      print("Result AAID=>$aaid");
      if (aaid == (isIOS ? "F1D0#1003" : "F1D0#0003")) {
        state = const ResultState.verifyBiometric();
      } else {
        state = const ResultState.verifyPIN();
      }
    }
  }
}
