import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/errors/errors.dart';

class ResetPinAuthorizeUsecase {
  ResetPinAuthorizeUsecase({required Repository repository})
      : _repository = repository;
  final Repository _repository;
  Future<Either<Failure, dynamic>> resetPinAuthorize(String cookie,WidgetRef ref) async {
    return await _repository.resetPinAuthorize(cookie,ref);
  }
}
