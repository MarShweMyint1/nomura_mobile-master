import 'package:dartz/dartz.dart';
import 'package:nomura_mobile/nomura/data/params/resend_sms.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/errors/errors.dart';

class ResendMailUsecase {
  ResendMailUsecase({required Repository repository})
      : _repository = repository;
  final Repository _repository;

  Future<Either<Failure, dynamic>> resendMail(ResendSMSParams params) async =>
      await _repository.resendMail(params);
}
