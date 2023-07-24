// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:nomura_mobile/nomura/data/model/login_request.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/model/login/credentials.dart';

abstract class LoginRepository {
  Future<Credentials> login({
    required Uri uri,
    required LoginRequest loginRequest,
  });
}
