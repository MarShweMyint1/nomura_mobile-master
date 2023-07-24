// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/user_interaction_operation_state.dart';
import 'package:nomura_mobile/nomura/errors/error_exception.dart';
import 'package:nomura_mobile/nomura/utils/constant_utils.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

abstract class SelectAuthenticatorUseCase {
  Future<void> execute(String aaid, UserInteractionOperationState state);
}

@Injectable(as: SelectAuthenticatorUseCase)
class SelectAuthenticatorUseCaseImpl implements SelectAuthenticatorUseCase {
  final StateRepository<UserInteractionOperationState>
      _userInteractionOperationStateRepository;

  SelectAuthenticatorUseCaseImpl(this._userInteractionOperationStateRepository);

  @override
  Future<void> execute(
    String aaid,
    UserInteractionOperationState? state,
  ) async {
    debugPrint('execute auth====================>');
    debugPrint('aaid of the selected auth====================>$aaid');
    debugPrint('aaid log ================>${aaid.isPin}');

    debugPrint('state===================>$state');
    if (state == null) {
      throw BusinessException.invalidState();
    }
    final authenticatorSelectionContext = state.authenticatorSelectionContext;
    if (authenticatorSelectionContext == null) {
      throw BusinessException.invalidState();
    }

    if (aaid == (isIOS ? "F1D0#1001" : "F1D0#0001") &&
        !_isPinEnrolled(authenticatorSelectionContext)) {
      debugPrint('not pin=========================>');
      // onNotEnrolled.call(authenticatorSelectionContext.account.username);
    }
    if (aaid == "F1D0#0001" &&
        !_isFingerPrintEnrolled(authenticatorSelectionContext)) {
      // onNotEnrolled.call(authenticatorSelectionContext.account.username);
    }
    final authenticatorSelectionHandler = state.authenticatorSelectionHandler;
    if (authenticatorSelectionHandler == null) {
      throw BusinessException.invalidState();
    }
    await authenticatorSelectionHandler.aaid(aaid);
    _userInteractionOperationStateRepository.save(
      state.copyWith(
        authenticatorSelectionHandler: null,
        accountSelectionHandler: null,
      ),
    );
    debugPrint('select authenticator worked until the end');
  }

  bool _isPinEnrolled(AuthenticatorSelectionContext context) {
    var filteredAuthenticators =
        context.authenticators.where((e) => e.aaid.isPin);
    if (filteredAuthenticators.isNotEmpty) {
      return filteredAuthenticators.first.userEnrollment
          .isEnrolled(context.account.username);
    }

    return false;
  }

  bool _isFingerPrintEnrolled(AuthenticatorSelectionContext context) {
    var filteredAuthenticators =
        context.authenticators.where((e) => e.aaid.isFingerprint);
    if (filteredAuthenticators.isNotEmpty) {
      return filteredAuthenticators.first.userEnrollment
          .isEnrolled(context.account.username);
    }

    return false;
  }
}
