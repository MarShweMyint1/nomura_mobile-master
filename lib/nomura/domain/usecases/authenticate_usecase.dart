// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/domain/operation/user_interaction_operation_state.dart';
import 'package:nomura_mobile/nomura/domain/usecases/cancel_user_interaction_operation_usecase.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/pwd_authz/pwd_authz_provider.dart';
import 'package:nomura_mobile/nomura/ui/deregister/deregisteration_operation.dart';
import 'package:nomura_mobile/nomura/utils/enumeration.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/client_provider/client_provider.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

import '../../errors/error_handler.dart';

abstract class AuthenticateUseCase {
  Future<void> execute({
    required String username,
    required SessionProvider? sessionProvider,
    required OperationType operationType,
    required WidgetRef ref,
    required AuthType authType,
  });
}

@Injectable(as: AuthenticateUseCase)
class AuthenticateUseCaseImpl implements AuthenticateUseCase {
  final ClientProvider _clientProvider;
  final AuthenticatorSelector _authenticatorSelector;
  final BiometricUserVerifier _biometricUserVerifier;
  final FingerprintUserVerifier _fingerprintUserVerifier;
  final PinUserVerifier _pinUserVerifier;
  final StateRepository<UserInteractionOperationState>
      _userInteractionOperationStateRepository;
  final StateRepository<OperationType> _operationTypeRepository;
  final ErrorHandler _errorHandler;

  AuthenticateUseCaseImpl(
      this._clientProvider,
      this._authenticatorSelector,
      this._biometricUserVerifier,
      this._fingerprintUserVerifier,
      this._pinUserVerifier,
      this._operationTypeRepository,
      this._errorHandler,
      this._userInteractionOperationStateRepository);

  @override
  Future<void> execute({
    required String username,
    required SessionProvider? sessionProvider,
    required OperationType operationType,
    required WidgetRef ref,
    AuthType authType = AuthType.login,
  }) async {
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

      // //! Forget PIN
      // if (authType == "forgetpin") {
      //   // ref.read(resultNotifierProvider.notifier).onSuccess(
      //   //       "F1D0#0003",
      //   //       authType,
      //   //     );

      //   await ref
      //       .read(resetPinAuthorizeNotifierProvider.notifier)
      //       .resetPinAuthorizeFunc(cookie[0], ref)
      //       .whenComplete(() {
      //     List<Cookie> cookies = ref.read(cookieProvider);
      //     final List<CookieContainer> containers = cookies
      //         .map((cookie) => CookieContainer(
      //               uri: Uri.parse(
      //                   '${UrlUtils.prodUrl}/${UrlUtils.pinResetAuthorizeEndPoint}'),
      //               cookie: cookie.toString(),
      //             ))
      //         .toList();
      //     debugPrint(
      //         'containers list in dio reset pin==>${containers.first.cookie}');

      //     AuthorizationProvider authProvider =
      //         CookieAuthorizationProvider(cookieContainers: containers);
      //     ref
      //         .read(authorizationStorageProvider.notifier)
      //         .saveAuthProvider(authProvider);
      //     ref.read(deregistrationNotifierProvider.notifier).deregistration(
      //         username: username,
      //         authorizationProvider: authProvider,
      //         ref: ref);
      //   });
      // }
      // //! Deregistration
      if (authType == AuthType.deregistration) {
        deregistrationOperation(username, ref);
      }
      //! PIN Change
      // else if (authType == AuthType.pinChange) {
      //   SaveLocal().saveIsChangePin(false);
      //   ref
      //       .read(pinChangeNotifierProvider.notifier)
      //       .pinChangeNotifier(username, ref);
      // }
      // //! Login (Default)
      // else {
      //   debugPrint("Login Inband Auth");
      ref.read(authzNotifierProvider.notifier).authzFunc();
      // }
      _userInteractionOperationStateRepository.reset();
    }).onError((error) async {
      debugPrint('In-band authentication failed: ${error.description}');
      // _operationTypeRepository.reset();
      // print('error====>$error');
      // print('error cause ===>${error.cause}');
      // print('error description ===>${error.description}');
      // _errorHandler.handle(
      //   exception: error,
      //   operationType: OperationType.authentication,
      // );
      CancelUserInteractionOperationUseCase
          cancelUserInteractionOperationUseCase =
          GetIt.I.get<CancelUserInteractionOperationUseCase>();
      await cancelUserInteractionOperationUseCase.execute().whenComplete(() {
        debugPrint("CANCEL LOGIN >>>>>");
        _errorHandler.handle(
          exception: error,
          operationType: OperationType.authentication,
        );
      }).catchError((error) {});
    });

    if (sessionProvider != null) {
      authentication.sessionProvider(sessionProvider);
    }

    return await authentication.execute();
  }
}
