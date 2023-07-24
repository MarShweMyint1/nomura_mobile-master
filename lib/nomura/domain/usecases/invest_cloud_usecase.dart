import 'package:dartz/dartz.dart';
import 'package:nomura_mobile/nomura/data/model/invest_cloud_model.dart';
import 'package:nomura_mobile/nomura/data/params/invest_cloud_param.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/errors/errors.dart';

class InvestCloudUsecase {
  InvestCloudUsecase({required Repository repository})
      : _repository = repository;
  final Repository _repository;

  Future<Either<Failure, InvestCloud>> investCloudUsecase(
          InvestCloudParam params) async =>
      await _repository.investCloud(params);
}
