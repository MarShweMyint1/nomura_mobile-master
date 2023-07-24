// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:injectable/injectable.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/user_interaction_operation_state.dart';
import 'package:nomura_mobile/nomura/errors/error_exception.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

abstract class VerifyPinUseCase {
  Future<void> execute(String pin);
}

@Injectable(as: VerifyPinUseCase)
class VerifyPinUseCaseImpl extends VerifyPinUseCase {
  final StateRepository<UserInteractionOperationState>
      _userInteractionOperationStateRepository;

  VerifyPinUseCaseImpl(this._userInteractionOperationStateRepository);

  @override
  Future<void> execute(String pin) async {
    final handler =
        _userInteractionOperationStateRepository.state?.userVerificationHandler;
    if (handler == null) throw BusinessException.invalidState();
    if (handler is! PinUserVerificationHandler) {
      throw BusinessException.invalidState();
    }
    await handler.verifyPin(pin);
  }
}
