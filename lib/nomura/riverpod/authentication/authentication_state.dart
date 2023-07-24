import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';

extension Getters on AuthenticationState {
  bool get isLoading => this is Loading;
}

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.data() = Data;
  const factory AuthenticationState.initial() = Initial;
  const factory AuthenticationState.loading() = Loading;
  const factory AuthenticationState.error() = Error;
  const factory AuthenticationState.timeOut({String? message}) = TimeOut;
}
