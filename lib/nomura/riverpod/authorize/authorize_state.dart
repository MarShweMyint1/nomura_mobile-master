import 'package:freezed_annotation/freezed_annotation.dart';

part 'authorize_state.freezed.dart';

extension Getters on AuthorizeState {
  bool get isLoading => this is Loading;
}

@freezed
class AuthorizeState with _$AuthorizeState {
  const factory AuthorizeState.data({required bool isTrusted}) = Data;
  const factory AuthorizeState.initial() = Initial;
  const factory AuthorizeState.loading() = Loading;
  const factory AuthorizeState.error({String? message}) = Error;
  const factory AuthorizeState.timeOut({String? message}) = TimeOut;
}
