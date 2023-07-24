import 'package:freezed_annotation/freezed_annotation.dart';
part 'resend_sms.freezed.dart';

@freezed
class ResendSMSParams with _$ResendSMSParams {
  factory ResendSMSParams({
    required String userName,
    required bool generate,
  }) = _ResendSMSParams;
}
