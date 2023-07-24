import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_login_model.dart';
import 'package:nomura_mobile/nomura/data/model/reset_pin_authorize/reset_pin_authorize.dart';
part 'reset_pin_authorize_state.freezed.dart';

extension Getters on ResetPinAuthorizeState {
  bool get isLoading => this is Loading;
}

@Freezed()
class ResetPinAuthorizeState with _$ResetPinAuthorizeState {
  const factory ResetPinAuthorizeState.data({required ResetPinAuthorizeModel data}) =
      Data;
  const factory ResetPinAuthorizeState.loading() = Loading;
  const factory ResetPinAuthorizeState.initial() = Initial;
  const factory ResetPinAuthorizeState.unauthorize(
      {required LegacyLoginModel data}) = Unauthorize;
  const factory ResetPinAuthorizeState.error({required String error}) = Error;
}
