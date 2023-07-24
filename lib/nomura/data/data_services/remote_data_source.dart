import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_login_model.dart';
import 'package:nomura_mobile/nomura/data/params/mobile_client_auth_param.dart';
import 'package:nomura_mobile/nomura/data/params/invest_cloud_param.dart';
import 'package:nomura_mobile/nomura/data/params/pwd_params.dart';
import 'package:nomura_mobile/nomura/data/model/token_model.dart';
import 'package:nomura_mobile/nomura/data/params/resend_sms.dart';
import 'package:nomura_mobile/nomura/data/params/submit_sms.dart';
import 'package:nomura_mobile/nomura/data/params/token_param.dart';
import 'package:nomura_mobile/nomura/data/params/validate_user.dart';

abstract class IRemoteDataSource {
  Future<LegacyLoginModel> legacyLoginInit(ValidateUserParams params);

  Future<dynamic> legacyProceed(ValidateUserParams params);
  Future<dynamic> submitSMS(SubmitSMSParams params, WidgetRef ref);
  Future<dynamic> resendSMS(ResendSMSParams params);
  Future<dynamic> resendMail(ResendSMSParams params);
  Future<dynamic> authorize(WidgetRef ref);
  Future<dynamic> pwdAuth(PwdParams params);
  Future<dynamic> inbandAuthz();
  Future<TokenModel> token(TokenParam params);
  Future<dynamic> investCloud(InvestCloudParam params);
  Future<dynamic> devicePrimalityCheck(ValidateUserParams params);
  Future<LegacyLoginModel> mobileClientAuth(
      MobileClientAuthParam params, WidgetRef ref);
  Future<dynamic> resetPinAuthorize(String cookie,WidgetRef ref);
}
