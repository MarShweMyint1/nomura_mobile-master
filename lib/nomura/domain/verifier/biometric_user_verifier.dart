// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/domain/operation/user_interaction_operation_state.dart';
import 'package:nomura_mobile/nomura/domain_state/domain_bloc.dart';
import 'package:nomura_mobile/nomura/domain_state/domain_event.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

@Injectable(as: BiometricUserVerifier)
class BiometricUserVerifierImpl implements BiometricUserVerifier {
  final DomainBloc _domainBloc;
  // final ErrorHandler _errorHandler;
  final StateRepository<UserInteractionOperationState>
      _userInteractionOperationStateRepository;

  BiometricUserVerifierImpl(
    this._domainBloc,
    // this._errorHandler,
    this._userInteractionOperationStateRepository,
  );

  @override
  void onValidCredentialsProvided() {
    debugPrint('onValidCredentialsProvided');
  }

  @override
  void verifyBiometric(BiometricUserVerificationContext context,
      BiometricUserVerificationHandler handler) async {
    final state = _userInteractionOperationStateRepository.state;
    debugPrint("biometric state===>$state");
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
    var aaid = await SaveLocal().getSelector();
    _domainBloc.add(BiometricUserVerificationEvent(
      aaid: aaid.toString(),
      operationType: OperationType.authentication,
    ));
  }
}
