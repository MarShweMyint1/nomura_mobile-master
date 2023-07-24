import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nomura_mobile/nomura/data/model/authz_model.dart';

part 'pwd_authz_state.freezed.dart';

extension Getters on PwdAuthzState {
  bool get isLoading => this is Loading;
}

@freezed
class PwdAuthzState with _$PwdAuthzState {
  const factory PwdAuthzState.data({required AuthzModel data}) = Data;
  const factory PwdAuthzState.initial() = Initial;
  const factory PwdAuthzState.loading() = Loading;

  const factory PwdAuthzState.error({String? message}) = Error;
  const factory PwdAuthzState.timeOut({String? message}) = TimeOut;
}
