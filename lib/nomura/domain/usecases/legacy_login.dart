import 'package:dartz/dartz.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_login_model.dart';
import 'package:nomura_mobile/nomura/data/params/validate_user.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/errors/errors.dart';

class LegacyLoginUsecase {
  LegacyLoginUsecase({required Repository repository})
      : _repository = repository;
  final Repository _repository;

  Future<Either<Failure, LegacyLoginModel>> legacyLogin(
          ValidateUserParams params) async =>
      await _repository.legacyLoginInit(params);
}
