// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/domain/operation/user_interaction_operation_state.dart';
import 'package:nomura_mobile/nomura/domain/usecases/create_device_information_usecase.dart';
import 'package:nomura_mobile/nomura/domain_state/domain_bloc.dart';
import 'package:nomura_mobile/nomura/domain_state/domain_event.dart';
import 'package:nomura_mobile/nomura/errors/error_handler.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/client_provider/client_provider.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

abstract class RegistrationOpChangeSdkUseCase {
  Future<void> execute({
    required String username,
    required AuthorizationProvider? authorizationProvider,
    required WidgetRef ref,
    required String aaid,
  });
}

@Injectable(as: RegistrationOpChangeSdkUseCase)
class RegistrationOpChangeSdkUseCaseImpl
    implements RegistrationOpChangeSdkUseCase {
  final CreateDeviceInformationUseCase _createDeviceInformationUseCase;
  final AuthenticatorSelector _authenticatorSelector;
  final PinEnroller _pinEnroller;
  final BiometricUserVerifier _biometricUserVerifier;
  final FingerprintUserVerifier _fingerprintUserVerifier;
  final StateRepository<UserInteractionOperationState>
      _userInteractionOperationStateRepository;
  final DomainBloc _domainBloc;
  final StateRepository<OperationType> _operationTypeRepository;
  final ClientProvider clientProvider;
  final ErrorHandler _errorHandler;

  RegistrationOpChangeSdkUseCaseImpl(
    this._createDeviceInformationUseCase,
    this._authenticatorSelector,
    this._pinEnroller,
    this._biometricUserVerifier,
    this._fingerprintUserVerifier,
    this._userInteractionOperationStateRepository,
    this._operationTypeRepository,
    this._domainBloc,
    this.clientProvider,
    this._errorHandler,
  );

  @override
  Future<void> execute({
    required String username,
    required AuthorizationProvider? authorizationProvider,
    required WidgetRef ref,
    required String aaid,
  }) async {
    final deviceInformation = await _createDeviceInformationUseCase.execute();

    debugPrint("OS Version:$deviceInformation");
    _operationTypeRepository.save(OperationType.registration);
    debugPrint('without device information');
    print('aaid in change sdk =-==>$aaid');
    var registration = clientProvider.client.operations.registration
        .username(username)
        .authenticatorSelector(_authenticatorSelector)
        .pinEnroller(_pinEnroller)
        .biometricUserVerifier(_biometricUserVerifier)
        .fingerprintUserVerifier(_fingerprintUserVerifier)
        .onSuccess(() {
      debugPrint('In-band registration succeeded.');

      SaveLocal().saveisBiometricEnabled(true);

      _domainBloc.add(ResultEvent(isBiometricChange: true));

      _userInteractionOperationStateRepository.reset();
    }).onError((error) {
      debugPrint('In-band registration failed: ${error.runtimeType}');

      ref.read(bioEnDisProvider.notifier).update((state) => false);

      _errorHandler.handle(
          exception: error,
          operationType: OperationType.registration,
          aaid: 'changeBiometric');
      _userInteractionOperationStateRepository.reset();
    });

    if (authorizationProvider != null) {
      registration.authorizationProvider(authorizationProvider);

      return await registration.execute();
    }
  }
}
