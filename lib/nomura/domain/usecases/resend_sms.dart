import 'package:dartz/dartz.dart';
import 'package:nomura_mobile/nomura/data/params/resend_sms.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/errors/errors.dart';

class ResendSMSUsecase {
  ResendSMSUsecase({required Repository repository}) : _repository = repository;
  final Repository _repository;

  Future<Either<Failure, dynamic>> resendSMS(ResendSMSParams params) async =>
      await _repository.resendSMS(params);
}
