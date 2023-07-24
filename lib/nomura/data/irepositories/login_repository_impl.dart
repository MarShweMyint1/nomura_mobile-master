// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:injectable/injectable.dart';
import 'package:nomura_mobile/nomura/data/login/login_datasource.dart';
import 'package:nomura_mobile/nomura/data/model/login_request.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/model/login/credentials.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/login_repository.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _loginDataSource;

  LoginRepositoryImpl(this._loginDataSource);

  @override
  Future<Credentials> login({
    required Uri uri,
    required LoginRequest loginRequest,
  }) async {
    return await _loginDataSource.login(uri: uri, loginRequest: loginRequest);
  }
}
