// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:nomura_mobile/nomura/errors/error_message_types.dart';

class BusinessException implements Exception {
  BusinessErrorType type;

  BusinessException(this.type);

  BusinessException.accountsNotFound()
      : type = BusinessErrorType.accountsNotFound;

  BusinessException.authenticatorNotFound()
      : type = BusinessErrorType.authenticatorNotFound;

  BusinessException.deviceInformationNotFound()
      : type = BusinessErrorType.deviceInformationNotFound;

  BusinessException.invalidState() : type = BusinessErrorType.invalidState;

  BusinessException.missingCookie() : type = BusinessErrorType.missingCookie;

  BusinessException.missingDispatchTokenResponse()
      : type = BusinessErrorType.missingDispatchTokenResponse;

  BusinessException.missingOpenSettingsOperationForUser()
      : type = BusinessErrorType.missingOpenSettingsOperationForUser;

  BusinessException.pinAuthenticatorNotFound()
      : type = BusinessErrorType.pinAuthenticatorNotFound;

  BusinessException.registeredAccountsNotFound()
      : type = BusinessErrorType.registeredAccountsNotFound;
}

class PinNotEnrolledException implements Exception {
  String username;

  PinNotEnrolledException(this.username);
}
