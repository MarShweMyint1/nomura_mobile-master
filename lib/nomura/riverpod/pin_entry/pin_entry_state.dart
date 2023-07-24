import 'package:freezed_annotation/freezed_annotation.dart';

part 'pin_entry_state.freezed.dart';

extension Getters on PinEntryState {
  bool get isLoading => this is Loading;
}

@freezed
class PinEntryState with _$PinEntryState {
  const factory PinEntryState.data() = Data;
  const factory PinEntryState.initial() = Initial;
  const factory PinEntryState.loading() = Loading;
  const factory PinEntryState.error({String? message}) = Error;
  const factory PinEntryState.timeOut({String? message}) = TimeOut;
}
