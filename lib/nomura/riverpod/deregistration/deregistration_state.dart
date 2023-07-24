import 'package:freezed_annotation/freezed_annotation.dart';

part 'deregistration_state.freezed.dart';

extension Getters on DeregistrationState {
  bool get isLoading => this is Loading;
}

@freezed
class DeregistrationState with _$DeregistrationState {
  const factory DeregistrationState.data() = Data;
  const factory DeregistrationState.initial() = Initial;
  const factory DeregistrationState.loading() = Loading;
  const factory DeregistrationState.error({String? message}) = Error;
  const factory DeregistrationState.timeOut({String? message}) = TimeOut;
}
