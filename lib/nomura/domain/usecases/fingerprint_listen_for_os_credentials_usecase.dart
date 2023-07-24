// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/user_interaction_operation_state.dart';
import 'package:nomura_mobile/nomura/errors/error_exception.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

abstract class FingerPrintListenForOsCredentialsUseCase {
  Future<void> execute();
}

@Injectable(as: FingerPrintListenForOsCredentialsUseCase)
class FingerPrintListenForOsCredentialsUseCaseImpl
    extends FingerPrintListenForOsCredentialsUseCase {
  final StateRepository<UserInteractionOperationState>
      _userInteractionOperationStateRepository;

  FingerPrintListenForOsCredentialsUseCaseImpl(
    this._userInteractionOperationStateRepository,
  );

  @override
  Future<void> execute() async {
    final state = _userInteractionOperationStateRepository.state;
    debugPrint("Fingerorint EXECUTE=>$state");
    if (state == null) throw BusinessException.invalidState();
    final handler = state.userVerificationHandler;
    if (handler == null) throw BusinessException.invalidState();
    if (handler is! FingerprintUserVerificationHandler) {
      throw BusinessException.invalidState();
    }
    _userInteractionOperationStateRepository.save(
      state.copyWith(
        accountSelectionHandler: null,
        authenticatorSelectionHandler: null,
        osAuthenticationListenHandler: await handler.listenForOsCredentials(),
      ),
    );
  }
}
