import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_login_model.dart';
part 'mobile_client_auth_state.freezed.dart';
extension Getters on MobileClientAuthState {
  bool get isLoading => this is Loading;
}
@freezed
class MobileClientAuthState with _$MobileClientAuthState {
  const factory MobileClientAuthState.data({required LegacyLoginModel data}) =
      Data;
  const factory MobileClientAuthState.initial() = Initial;
  const factory MobileClientAuthState.loading() = Loading;
  const factory MobileClientAuthState.error({required String? message}) = Error;
  const factory MobileClientAuthState.timeOut({required String? message}) =
      TimeOUt;
}


