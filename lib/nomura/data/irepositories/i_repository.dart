import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/data_services/remote_data_source.dart';
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
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/errors/errors.dart';

class IRepository implements Repository {
  IRepository({required IRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  final IRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, LegacyLoginModel>> legacyLoginInit(
      ValidateUserParams params) async {
    try {
      final userValidate = await _remoteDataSource.legacyLoginInit(params);
      return Right(userValidate);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, dynamic>> legacyProceed(
      ValidateUserParams params) async {
    try {
      final proceed = await _remoteDataSource.legacyProceed(params);
      return Right(proceed);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, dynamic>> submitSMS(
      SubmitSMSParams params, WidgetRef ref) async {
    try {
      final submittedSMS = await _remoteDataSource.submitSMS(params, ref);
      return Right(submittedSMS);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, dynamic>> resendSMS(ResendSMSParams params) async {
    try {
      final proceed = await _remoteDataSource.resendSMS(params);

      return Right(proceed);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, dynamic>> resendMail(ResendSMSParams params) async {
    try {
      final resendMails = await _remoteDataSource.resendMail(params);
      return Right(resendMails);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, dynamic>> authorize(WidgetRef ref) async {
    try {
      final authenticate = await _remoteDataSource.authorize(ref);
      return Right(authenticate);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, LegacyLoginModel>> pwdAuth(PwdParams params) async {
    try {
      final pwdAuthResp = await _remoteDataSource.pwdAuth(params);
      return Right(pwdAuthResp);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, TokenModel>> token(TokenParam params) async {
    try {
      final token = await _remoteDataSource.token(params);
      debugPrint("TOKEN LOG ==> $token");
      return Right(token);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AuthzModel>> pwdAuthz() async {
    try {
      final authzResp = await _remoteDataSource.inbandAuthz();
      return Right(authzResp);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, InvestCloud>> investCloud(
      InvestCloudParam params) async {
    try {
      final investCloudResp = await _remoteDataSource.investCloud(params);
      debugPrint('inves cloud resp=============> $investCloudResp');
      return Right(investCloudResp);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, dynamic>> deviceCheckPrimality(
      ValidateUserParams params) async {
    try {
      final checkPrimality =
          await _remoteDataSource.devicePrimalityCheck(params);
      return Right(checkPrimality);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, LegacyLoginModel>> mobileClientAuth(
      MobileClientAuthParam params, WidgetRef ref) async {
    try {
      final mobileClientAuth =
          await _remoteDataSource.mobileClientAuth(params, ref);
      return Right(mobileClientAuth);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, dynamic>> resetPinAuthorize(String cookie,WidgetRef ref) async {
    try {
      final pinAuthorize = await _remoteDataSource.resetPinAuthorize(cookie, ref);
      return Right(pinAuthorize);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
