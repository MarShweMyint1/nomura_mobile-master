import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_login_model.dart';
import 'package:nomura_mobile/nomura/data/params/mobile_client_auth_param.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/errors/errors.dart';

class MobileClientAuthUsecase {
  MobileClientAuthUsecase({required Repository repository})
      : _repository = repository;
  final Repository _repository;
  Future<Either<Failure, LegacyLoginModel>> mobileClientAuth(
          MobileClientAuthParam params,WidgetRef ref) async =>
      await _repository.mobileClientAuth(params,ref);
}
