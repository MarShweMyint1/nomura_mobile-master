import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_login_model.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_proceed_model.dart';

part 'resend_sms_state.freezed.dart';

extension Getters on ResendSMSState {
  bool get isLoading => this is Loading;
}

@freezed
class ResendSMSState with _$ResendSMSState {
  const factory ResendSMSState.data({required LegacyProceedModel data}) = Data;
  const factory ResendSMSState.notFound(
      {required LegacyLoginModel invalidData}) = InvalidData;
  const factory ResendSMSState.initial() = Initial;
  const factory ResendSMSState.loading() = Loading;
  const factory ResendSMSState.error({String? message}) = Error;
}
