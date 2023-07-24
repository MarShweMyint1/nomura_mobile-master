import 'package:dartz/dartz.dart';
import 'package:nomura_mobile/nomura/data/model/authz_model.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/errors/errors.dart';

class PwdAuthzUsecase {
  PwdAuthzUsecase({required Repository repository}) : _repository = repository;
  final Repository _repository;

  Future<Either<Failure, AuthzModel>> pwdAuthzUsecase() async =>
      await _repository.pwdAuthz();
}
