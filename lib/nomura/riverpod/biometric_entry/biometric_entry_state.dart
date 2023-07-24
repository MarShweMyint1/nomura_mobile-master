import 'package:freezed_annotation/freezed_annotation.dart';

part 'biometric_entry_state.freezed.dart';

extension Getters on BiometricEntryState {
  bool get isLoading => this is Loading;
}

@freezed
class BiometricEntryState with _$BiometricEntryState {
  const factory BiometricEntryState.data() = Data;
  const factory BiometricEntryState.initial() = Initial;
  const factory BiometricEntryState.loading() = Loading;
  const factory BiometricEntryState.error({String? message}) = Error;
  const factory BiometricEntryState.timeOut({String? message}) = TimeOut;
}
