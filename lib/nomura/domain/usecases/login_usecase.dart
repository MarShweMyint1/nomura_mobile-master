// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:injectable/injectable.dart';
import 'package:nomura_mobile/nomura/data/model/login_request.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/model/login/credentials.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/login_repository.dart';

abstract class LoginUseCase {
  Future<Credentials> execute({
    required Uri uri,
    required LoginRequest loginRequest,
  });
}

@Injectable(as: LoginUseCase)
class LoginUseCaseImpl implements LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCaseImpl(this._loginRepository);

  @override
  Future<Credentials> execute({
    required Uri uri,
    required LoginRequest loginRequest,
  }) async {
    return await _loginRepository.login(uri: uri, loginRequest: loginRequest);
  }
}
