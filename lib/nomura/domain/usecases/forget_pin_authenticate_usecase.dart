// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/deregistration/deregistration_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/reset_pin_authorize/reset_pin_authorize_provider.dart';
import 'package:nomura_mobile/nomura/utils/enumeration.dart';
import 'package:nomura_mobile/nomura/utils/url_utils.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/client_provider/client_provider.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

import '../../errors/error_handler.dart';

abstract class ForgetPinAuthenticateUseCase {
  Future<void> execute({
    required String username,
    required SessionProvider? sessionProvider,
    required OperationType operationType,
    required WidgetRef ref,
    required AuthType authType,
  });
}

@Injectable(as: ForgetPinAuthenticateUseCase)
class ForgetPinAuthenticateUseCaseImpl implements ForgetPinAuthenticateUseCase {
  final ClientProvider _clientProvider;
  final AuthenticatorSelector _authenticatorSelector;
  final BiometricUserVerifier _biometricUserVerifier;
  final FingerprintUserVerifier _fingerprintUserVerifier;
  final PinUserVerifier _pinUserVerifier;
  final StateRepository<OperationType> _operationTypeRepository;
  final ErrorHandler _errorHandler;

  ForgetPinAuthenticateUseCaseImpl(
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
    AuthType authType = AuthType.forgetPIn,
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
      //! Forget PIN
      await ref
          .read(resetPinAuthorizeNotifierProvider.notifier)
          .resetPinAuthorizeFunc(cookie[0], ref)
          .whenComplete(() {
        List<Cookie> cookies = ref.read(cookieProvider);
        final List<CookieContainer> containers = cookies
            .map((cookie) => CookieContainer(
                  uri: Uri.parse(
                      '${UrlUtils.prodUrl}/${UrlUtils.pinResetAuthorizeEndPoint}'),
                  cookie: cookie.toString(),
                ))
            .toList();

        AuthorizationProvider authProvider =
            CookieAuthorizationProvider(cookieContainers: containers);
        ref
            .read(authorizationStorageProvider.notifier)
            .saveAuthProvider(authProvider);
        ref.read(deregistrationNotifierProvider.notifier).deregistration(
            username: username, authorizationProvider: authProvider, ref: ref);
      });
    }).onError((error) async {
      debugPrint('In-band authentication failed: ${error.runtimeType}');
      _operationTypeRepository.reset();
      _errorHandler.handle(
          exception: error, operationType: OperationType.authentication);
    });

    if (sessionProvider != null) {
      authentication.sessionProvider(sessionProvider);
    }

    return await authentication.execute();
  }
}
