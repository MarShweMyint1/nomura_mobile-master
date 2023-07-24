import 'package:dartz/dartz.dart';
import 'package:nomura_mobile/nomura/data/params/validate_user.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/errors/errors.dart';

class DevicePrimalityCheckUsecase {
  DevicePrimalityCheckUsecase({required Repository repository})
      : _repository = repository;
  final Repository _repository;
  Future<Either<Failure, dynamic>> devicePrimalityCheck(
          ValidateUserParams params) async =>
      await _repository.deviceCheckPrimality(params);
}
