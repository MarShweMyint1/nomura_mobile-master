import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_login_model.dart';

part 'pwd_auth_state.freezed.dart';

extension Getters on PwdAuthState {
  bool get isLoading => this is Loading;
}

@freezed
class PwdAuthState with _$PwdAuthState {
  const factory PwdAuthState.data({required LegacyLoginModel data}) = Data;
  const factory PwdAuthState.initial() = Initial;
  const factory PwdAuthState.loading() = Loading;

  const factory PwdAuthState.error({String? message}) = Error;
  const factory PwdAuthState.timeOut({String? message}) = TimeOut;
}
