import 'package:freezed_annotation/freezed_annotation.dart';

part 'pin_change_state.freezed.dart';

extension Getters on PinChangeState {
  bool get isLoading => this is Loading;
}

@freezed
class PinChangeState with _$PinChangeState {
  const factory PinChangeState.data() = Data;
  const factory PinChangeState.initial() = Initial;
  const factory PinChangeState.loading() = Loading;
  const factory PinChangeState.error({String? message}) = Error;
  const factory PinChangeState.timeOut({String? message}) = TimeOut;
}
