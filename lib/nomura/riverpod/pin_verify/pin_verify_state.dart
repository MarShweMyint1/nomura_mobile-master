import 'package:freezed_annotation/freezed_annotation.dart';

part 'pin_verify_state.freezed.dart';

extension Getters on PinVerifyState {
  bool get isLoading => this is Loading;
}

@freezed
class PinVerifyState with _$PinVerifyState {
  const factory PinVerifyState.data() = Data;
  const factory PinVerifyState.initial() = Initial;
  const factory PinVerifyState.loading() = Loading;
  const factory PinVerifyState.error({String? message}) = Error;
  const factory PinVerifyState.timeOut({String? message}) = TimeOut;
}
