import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_state.freezed.dart';

extension Getters on RegistrationState {
  bool get isLoading => this is Loading;
}

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState.data() = Data;
  const factory RegistrationState.initial() = Initial;
  const factory RegistrationState.loading() = Loading;
  const factory RegistrationState.error() = Error;
  const factory RegistrationState.timeOut({String? message}) = TimeOut;
}
