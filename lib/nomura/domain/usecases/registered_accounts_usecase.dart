// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:injectable/injectable.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/client_provider/client_provider.dart';

abstract class RegisteredAccountsUseCase {
  Future<Set<Account>> execute();
}

@Injectable(as: RegisteredAccountsUseCase)
class RegisteredAccountsUseCaseImpl extends RegisteredAccountsUseCase {
  final ClientProvider _clientProvider;

  RegisteredAccountsUseCaseImpl(this._clientProvider);

  @override
  Future<Set<Account>> execute() async {
    return await _clientProvider.client.localData.accounts;
  }
}
