import 'package:dartz/dartz.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_login_model.dart';
import 'package:nomura_mobile/nomura/data/params/pwd_params.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/errors/errors.dart';

class PwdAuthUsecase {
  PwdAuthUsecase({required Repository repository}) : _repository = repository;
  final Repository _repository;

  Future<Either<Failure, LegacyLoginModel>> pwdAuthUsecase(
          PwdParams params) async =>
      await _repository.pwdAuth(params);
}
