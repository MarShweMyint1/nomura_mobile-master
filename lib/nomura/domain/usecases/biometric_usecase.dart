// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';
import 'package:nomura_mobile/nomura/domain/operation/user_interaction_operation_state.dart';
import 'package:nomura_mobile/nomura/domain_state/domain_bloc.dart';
import 'package:nomura_mobile/nomura/domain_state/domain_event.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/client_provider/client_provider.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

abstract class BiometricUseCase {
  Future<void> execute({
    required String username,
    required String aaid,
    required AuthorizationProvider? authorizationProvider,
  });
}

@Injectable(as: BiometricUseCase)
class BiometricUseCaseImpl implements BiometricUseCase {
  final AuthenticatorSelector _authenticatorSelector;
  final BiometricUserVerifier _biometricUserVerifier;
  final StateRepository<UserInteractionOperationState>
      _userInteractionOperationStateRepository;
  final StateRepository<OperationType> _operationTypeRepository;
  final ClientProvider clientProvider;
  final DomainBloc _domainBloc;

  BiometricUseCaseImpl(
    this._authenticatorSelector,
    this._biometricUserVerifier,
    this._userInteractionOperationStateRepository,
    this._operationTypeRepository,
    this.clientProvider,
    this._domainBloc,
  );

  @override
  Future<void> execute({
    required String username,
    required String aaid,
    required AuthorizationProvider? authorizationProvider,
  }) async {
    debugPrint('Start BIO In-band registration 11 succeeded.');
    _operationTypeRepository.save(OperationType.authentication);
    var registration = clientProvider.client.operations.authentication
        .username(username)
        .authenticatorSelector(_authenticatorSelector)
        .biometricUserVerifier(_biometricUserVerifier)
        .onSuccess((authorizationProvider) {
      debugPrint('In-band authenticate 11 succeeded.');
      _domainBloc.add(BiometricUserVerificationEvent(
        aaid: aaid,
        operationType: OperationType.registration,
      ));

      _userInteractionOperationStateRepository.reset();
    }).onError((error) {
      debugPrint('In-band registration 11 failed: ${error.runtimeType}');
      _userInteractionOperationStateRepository.reset();
    });

    return await registration.execute();
  }
}
