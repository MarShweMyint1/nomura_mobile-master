import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_login_model.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_proceed_model.dart';

part 'submit_sms_state.freezed.dart';

extension Getters on SubmitSMSState {
  bool get isLoading => this is Loading;
}

@freezed
class SubmitSMSState with _$SubmitSMSState {
  const factory SubmitSMSState.data({required LegacyLoginModel data}) = Data;
  const factory SubmitSMSState.lock({required LegacyLoginModel lock}) = Lock;
  const factory SubmitSMSState.initial() = Initial;
  const factory SubmitSMSState.loading() = Loading;
  const factory SubmitSMSState.invalid(
      {required LegacyProceedModel invalidData}) = InvalidData;
  const factory SubmitSMSState.error({String? message}) = Error;
}
