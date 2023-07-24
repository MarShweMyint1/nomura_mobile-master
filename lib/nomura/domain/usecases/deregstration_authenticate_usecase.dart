// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/ui/deregister/deregisteration_operation.dart';
import 'package:nomura_mobile/nomura/utils/enumeration.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/client_provider/client_provider.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';
import '../../errors/error_handler.dart';

abstract class DeregstrationAuthenticateUsecase {
  Future<void> execute({
    required String username,
    required SessionProvider? sessionProvider,
    required OperationType operationType,
    required WidgetRef ref,
    required AuthType authType,
  });
}

@Injectable(as: DeregstrationAuthenticateUsecase)
class DeregstrationAuthenticateUsecaseImpl
    implements DeregstrationAuthenticateUsecase {
  final ClientProvider _clientProvider;
  final AuthenticatorSelector _authenticatorSelector;
  final BiometricUserVerifier _biometricUserVerifier;
  final FingerprintUserVerifier _fingerprintUserVerifier;
  final PinUserVerifier _pinUserVerifier;
  final StateRepository<OperationType> _operationTypeRepository;
  final ErrorHandler _errorHandler;

  DeregstrationAuthenticateUsecaseImpl(
      this._clientProvider,
      this._authenticatorSelector,
      this._biometricUserVerifier,
      this._fingerprintUserVerifier,
      this._pinUserVerifier,
      this._operationTypeRepository,
      this._errorHandler);

  @override
  Future<void> execute({
    required String username,
    required SessionProvider? sessionProvider,
    required OperationType operationType,
    required WidgetRef ref,
    // bool isForgetPin = false,
    AuthType authType = AuthType.deregistration,
  }) async {
    debugPrint("OType ===>>> $authType");
    _operationTypeRepository.save(operationType);
    var authentication = _clientProvider.client.operations.authentication
        .username(username)
        .authenticatorSelector(_authenticatorSelector)
        .biometricUserVerifier(_biometricUserVerifier)
        .fingerprintUserVerifier(_fingerprintUserVerifier)
        .pinUserVerifier(_pinUserVerifier)
        .onSuccess((AuthorizationProvider? authorizationProvider) async {
      debugPrint(
          'In-band authentication succeeded. and ${authorizationProvider.runtimeType}');

      List<String> cookie = [];
      if (authorizationProvider is CookieAuthorizationProvider) {
        for (final container in authorizationProvider.cookieContainers) {
          debugPrint("Received cookie: ${container.cookie.toString()}");
          cookie = container.cookie.split(';');
          debugPrint('cookie ===>$cookie');
          SaveLocal().saveCookie(cookie[0]);
        }
        ref
            .read(authorizationStorageProvider.notifier)
            .saveAuthProvider(authorizationProvider);
      } else if (authorizationProvider is JwtAuthorizationProvider) {
        debugPrint("Received JWT is ${authorizationProvider.jwt}");
      }

      //! Deregistration
      deregistrationOperation(username, ref);
    }).onError((error) async {
      debugPrint('In-band authentication failed: ${error.runtimeType}');
      _operationTypeRepository.reset();
      print('error====>$error');
      print('error cause ===>${error.cause}');
      print('error description ===>${error.description}');

      _errorHandler.handle(
          exception: error, operationType: OperationType.deregistration);

      // AuthenticateUseCase authenticateUseCase = GetIt.I<AuthenticateUseCase>();
      // await authenticateUseCase
      //     .execute(
      //         username: username,
      //         sessionProvider: null,
      //         operationType: OperationType.authentication,
      //         ref: ref,
      //         authType: authType)
      //     .catchError((error) {
      //   debugPrint("AuthenticateUseCase Execute Error ===>> $error");
      // });
    });

    if (sessionProvider != null) {
      authentication.sessionProvider(sessionProvider);
    }

    return await authentication.execute();
  }
}
