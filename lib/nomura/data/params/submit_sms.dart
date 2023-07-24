import 'package:freezed_annotation/freezed_annotation.dart';
part 'submit_sms.freezed.dart';

@freezed
class SubmitSMSParams with _$SubmitSMSParams {
  factory SubmitSMSParams({
    required String userName,
    required String otpCode,
  }) = _SubmitSMSParams;
}
