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
import 'package:nomura_mobile/nomura/errors/error_handler.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/result/result_provider.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/client_provider/client_provider.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

abstract class RegistrationUseCase {
  Future<void> execute({
    required String username,
    required AuthorizationProvider? authorizationProvider,
    required WidgetRef ref,
    required String aaid,
  });
}

@Injectable(as: RegistrationUseCase)
class RegistrationUseCaseImpl implements RegistrationUseCase {
  final CreateDeviceInformationUseCase _createDeviceInformationUseCase;
  final AuthenticatorSelector _authenticatorSelector;
  final PinEnroller _pinEnroller;
  final BiometricUserVerifier _biometricUserVerifier;
  final FingerprintUserVerifier _fingerprintUserVerifier;
  final StateRepository<UserInteractionOperationState>
      _userInteractionOperationStateRepository;
  final StateRepository<OperationType> _operationTypeRepository;
  final ClientProvider clientProvider;
  final ErrorHandler _errorHandler;
  final RouteGenerator _routeGenerator;

  RegistrationUseCaseImpl(
    this._createDeviceInformationUseCase,
    this._authenticatorSelector,
    this._pinEnroller,
    this._biometricUserVerifier,
    this._fingerprintUserVerifier,
    this._userInteractionOperationStateRepository,
    this._operationTypeRepository,
    this.clientProvider,
    this._errorHandler,
    this._routeGenerator,
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
    var registration = clientProvider.client.operations.registration
        .username(username)
        .deviceInformation(deviceInformation)
        .authenticatorSelector(_authenticatorSelector)
        .pinEnroller(_pinEnroller)
        .biometricUserVerifier(_biometricUserVerifier)
        .fingerprintUserVerifier(_fingerprintUserVerifier)
        .onSuccess(() async {
      debugPrint('In-band registration succeeded.');
      var routeName = await SaveLocal().getRouteName();
      print("Now Current Route in Registration=====>$routeName");
      if (routeName == Routes.confirmPinRoute) {
        ref.read(resultNotifierProvider.notifier).onSuccess(
              aaid,
              OperationType.registration,
            );
      } else if (routeName == Routes.setupBiometricRoute) {
        SaveLocal().saveisBiometricEnabled(true);
        SaveLocal().saveIsBiometricEnrolled(true);
        _routeGenerator.pushSuccessFulScreen();
      } else if (routeName == Routes.fingerprintRoute) {
        _routeGenerator.pushSuccessFulScreen();
      } else if (routeName == Routes.confirmResetPinRoute) {
        _routeGenerator.pinChangeSuccessFulScreen(true);
      }

      _userInteractionOperationStateRepository.reset();
    }).onError((error) {
      debugPrint('In-band registration failed: ${error.runtimeType}');
      print('operation fido error description2---->${error.description}');
      ref.read(toggleValueProvider.notifier).toggle(true);
      _errorHandler.handle(exception: error, aaid: aaid);
      _userInteractionOperationStateRepository.reset();
    });

    if (authorizationProvider != null) {
      registration.authorizationProvider(authorizationProvider);
    }

    return await registration.execute();
  }
}
