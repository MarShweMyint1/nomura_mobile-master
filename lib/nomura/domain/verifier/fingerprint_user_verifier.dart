// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/user_interaction_operation_state.dart';
import 'package:nomura_mobile/nomura/domain_state/domain_bloc.dart';
import 'package:nomura_mobile/nomura/domain_state/domain_event.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

@Injectable(as: FingerprintUserVerifier)
class FingerprintUserVerifierImpl implements FingerprintUserVerifier {
  final DomainBloc _domainBloc;
  // final ErrorHandler _errorHandler;
  final StateRepository<UserInteractionOperationState>
      _userInteractionOperationStateRepository;

  FingerprintUserVerifierImpl(
    this._domainBloc,
    // this._errorHandler,
    this._userInteractionOperationStateRepository,
  );

  @override
  void onValidCredentialsProvided() {
    debugPrint('onValidCredentialsProvided');
  }

  @override
  void verifyFingerprint(
    FingerprintUserVerificationContext context,
    FingerprintUserVerificationHandler handler,
  ) {
    debugPrint(
        "Fingerprint Verifier State=>${_userInteractionOperationStateRepository.state}");
    final state = _userInteractionOperationStateRepository.state;
    if (state == null) {
      // _errorHandler.handle(BusinessException.invalidState());
      return;
    }
    _userInteractionOperationStateRepository.save(
      state.copyWith(
        accountSelectionHandler: null,
        authenticatorSelectionHandler: null,
        userVerificationHandler: handler,
      ),
    );
    _domainBloc.add(FingerPrintUserVerificationEvent());
  }
}
