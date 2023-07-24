import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_state.freezed.dart';

extension Getters on ResultState {
  bool get isLoading => this is Loading;
}

@freezed
class ResultState with _$ResultState {
  const factory ResultState.pinResult() = PinData;
  const factory ResultState.biometricResult() = BiometricData;
  const factory ResultState.fingerprintResult() = FingerprintData;
  const factory ResultState.verifyBiometric() = VerifyBiometricData;
  const factory ResultState.verifyPIN() = VerifyPINData;
  const factory ResultState.initial() = Initial;
  const factory ResultState.loading() = Loading;
  const factory ResultState.error({String? message}) = Error;
  const factory ResultState.timeOut({String? message}) = TimeOut;
}
