import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_login_model.dart';

part 'resend_mail_state.freezed.dart';

extension Getters on ResendMailState {
  bool get isLoading => this is Loading;
}

@freezed
class ResendMailState with _$ResendMailState {
  const factory ResendMailState.data({required LegacyLoginModel data}) = Data;
  const factory ResendMailState.initial() = Initial;
  const factory ResendMailState.loading() = Loading;
  const factory ResendMailState.error({String? message}) = Error;
}
