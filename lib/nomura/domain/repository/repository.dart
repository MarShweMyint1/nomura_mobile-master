import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/model/authz_model.dart';
import 'package:nomura_mobile/nomura/data/model/invest_cloud_model.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_login_model.dart';
import 'package:nomura_mobile/nomura/data/params/mobile_client_auth_param.dart';
import 'package:nomura_mobile/nomura/data/params/invest_cloud_param.dart';
import 'package:nomura_mobile/nomura/data/params/pwd_params.dart';
import 'package:nomura_mobile/nomura/data/model/token_model.dart';
import 'package:nomura_mobile/nomura/data/params/resend_sms.dart';
import 'package:nomura_mobile/nomura/data/params/submit_sms.dart';
import 'package:nomura_mobile/nomura/data/params/token_param.dart';
import 'package:nomura_mobile/nomura/data/params/validate_user.dart';
import 'package:nomura_mobile/nomura/errors/errors.dart';

abstract class Repository {
  Future<Either<Failure, LegacyLoginModel>> legacyLoginInit(
    ValidateUserParams params,
  );
  Future<Either<Failure, dynamic>> legacyProceed(ValidateUserParams params);
  Future<Either<Failure, dynamic>> submitSMS(
      SubmitSMSParams params, WidgetRef ref);
  Future<Either<Failure, dynamic>> resendSMS(ResendSMSParams params);
  Future<Either<Failure, dynamic>> resendMail(ResendSMSParams params);
  Future<Either<Failure, dynamic>> authorize(WidgetRef ref);
  Future<Either<Failure, LegacyLoginModel>> pwdAuth(PwdParams params);
  Future<Either<Failure, AuthzModel>> pwdAuthz();
  Future<Either<Failure, InvestCloud>> investCloud(InvestCloudParam params);
  Future<Either<Failure, TokenModel>> token(TokenParam params);
  Future<Either<Failure, dynamic>> deviceCheckPrimality(
      ValidateUserParams params);
  Future<Either<Failure, LegacyLoginModel>> mobileClientAuth(
      MobileClientAuthParam params, WidgetRef ref);
  Future<Either<Failure, dynamic>> resetPinAuthorize(String cookie,WidgetRef ref);
}
