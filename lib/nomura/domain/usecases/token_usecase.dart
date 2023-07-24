import 'package:dartz/dartz.dart';
import 'package:nomura_mobile/nomura/data/model/token_model.dart';
import 'package:nomura_mobile/nomura/data/params/token_param.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/errors/errors.dart';

class TokenUsecase {
  TokenUsecase({required Repository repository}) : _repository = repository;
  final Repository _repository;

  Future<Either<Failure, TokenModel>> token(TokenParam params) async =>
      await _repository.token(params);
}
