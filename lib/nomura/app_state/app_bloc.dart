// Copyright © 2022 Nevis Security AG. All rights reserved.
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/app_state/app_event.dart';
import 'package:nomura_mobile/nomura/app_state/app_state.dart';
import 'package:nomura_mobile/nomura/configuration/configuration_loader.dart';
import 'package:nomura_mobile/nomura/data/params/result_parameter.dart';
import 'package:nomura_mobile/nomura/data/params/select_authenticator_parameter.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/domain/usecases/authenticators_usecase.dart';
import 'package:nomura_mobile/nomura/domain/usecases/biometric_listen_for_os_credentials_usecase.dart';
import 'package:nomura_mobile/nomura/domain/usecases/cancel_pin_operation_usecase.dart';
import 'package:nomura_mobile/nomura/domain/usecases/cancel_user_interaction_operation_usecase.dart';
import 'package:nomura_mobile/nomura/domain/usecases/fingerprint_listen_for_os_credentials_usecase.dart';
import 'package:nomura_mobile/nomura/errors/error_exception.dart';
import 'package:nomura_mobile/nomura/errors/error_handler.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/domain_state/domain_bloc.dart';
import 'package:nomura_mobile/nomura/domain_state/domain_state.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';
import 'package:nomura_mobile/nomura/utils/device_detail.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/model/pin/pin_mode.dart';

@singleton
class AppBloc extends Bloc<AppEvent, AppState> {
  final FingerPrintListenForOsCredentialsUseCase
      _fingerPrintListenForOsCredentialsUseCase;
  final BiometricListenForOsCredentialsUseCase
      _biometricListenForOsCredentialsUseCase;
  final AuthenticatorsUseCase _authenticatorsUseCase;
  final ConfigurationLoader _configurationLoader;
  final CancelUserInteractionOperationUseCase
      _cancelUserInteractionOperationUseCase;
  final ErrorHandler _errorHandler;
  final DomainBloc _domainBloc;
  final RouteGenerator _globalNavigationManager;
  late StreamSubscription _domainSubscription;

  AppBloc(
    this._fingerPrintListenForOsCredentialsUseCase,
    this._biometricListenForOsCredentialsUseCase,
    this._authenticatorsUseCase,
    this._configurationLoader,
    this._cancelUserInteractionOperationUseCase,
    this._errorHandler,
    this._domainBloc,
    this._globalNavigationManager,
  ) : super(InitialState()) {
    _domainSubscription = _domainBloc.stream.listen((DomainState state) {
      add(AppDomainEvent(state));
    });
    on<AppDomainEvent>(_handleDomainEvent);
    on<UserFingerPrintEvent>(_handleUserFingerPrintEvent);
    on<UserPinEvent>(_handleUserPinEvent);
  }

  void _handleDomainEvent(
    AppDomainEvent event,
    Emitter<AppState> emit,
  ) async {
    final state = event.domainState;
    print("STATE=>$state");
    if (state is DomainVerifyState) {
      _handleDomainVerify(state, emit);
    } else if (state is DomainLoadingState) {
      emit(LoadingState());
    } else if (state is DomainFingerPrintResultState) {
      _globalNavigationManager.pushFingerPrintScreen(
        SelectAuthenticatorParameter(
          aaid: state.aaid,
          operationType: OperationType.registration,
          username: state.username,
        ),
      );
      return;
    } else if (state is DomainSetUpState) {
      bool isSupportBio = await SaveLocal().getSupportedDevice();
      if (isSupportBio) {
        await _biometricListenForOsCredentialsUseCase
            .execute(BiometricPromptOptions(
              title: "Biometric Registration",
              description: "Please setup biometric event",
              cancelButtonText: "",
            ))
            .then((_) {})
            .catchError((error) {
          _errorHandler.handle(exception: error);
        });
      }
    } else if (state is DomainPinChageResultState) {
      _globalNavigationManager.pinChangeSuccessFulScreen(false);
    } else if (state is DomainPinResultState) {
      _globalNavigationManager.pushBiometricScreen(
        SelectAuthenticatorParameter(
          aaid: state.aaid,
          operationType: OperationType.registration,
          username: state.username,
        ),
      );
      return;
    } else if (state is DomainResultState) {
      debugPrint("OP ==>>> ${state.operationType}");
      if (state.operationType == OperationType.deregistration) {
        _globalNavigationManager.pushSuccessFulDeregistrationScreen();
      } else {
        if (state.isBiometricChange != null &&
            (state.isBiometricChange ?? false)) {
          _globalNavigationManager
              .pushBiometricChangeSuccessfulScreen('enable');
        } else {
          _globalNavigationManager.pushSuccessFulScreen();
        }
      }
    } else if (state is DomainAuthenticationSucceededState) {
      _handleAuthenticationSucceeded(state);
    } else if (state is DomainResetPinResultState) {
      _globalNavigationManager.pinChangeSuccessFulScreen(true);
    }
  }

  void _handleDomainVerify(
    DomainVerifyState state,
    Emitter<AppState> emit,
  ) async {
    if (state is DomainPinState) {
      _handleDomainPinState(state, emit);
    } else if (state is DomainVerifyFingerPrintState) {
      int osversion = 0;

      osversion = int.parse(await getDeviceOSLevel());

      if (osversion < 29) {
        fingerprintPrompted(_globalNavigationManager.navigatorContext!);
      }
      await _fingerPrintListenForOsCredentialsUseCase
          .execute()
          .then((_) {})
          .catchError((error) {
        // _errorHandler.handle(error);
      });
    }
  }

  void _handleDomainPinState(
    DomainPinState state,
    Emitter<AppState> emit,
  ) async {
    debugPrint("PIN MODE ==>> ${state.mode}");
    final isForgetPin = await SaveLocal().getIsForgetPin();
    var routeName = await SaveLocal().getRouteName();
    if (isForgetPin ?? false) {
      _globalNavigationManager.pop();
    }
    switch (state.mode) {
      case PinMode.enrollment:
        (isForgetPin ?? false)
            ? _globalNavigationManager.pushResetPinScreen()
            : _globalNavigationManager.pushPinScreen();
        break;
      case PinMode.verification:
        if (state.lastRecoverableError != null) {
          if (routeName == Routes.changeLoginPin) {
            // CancelUserInteractionOperationUseCase
            //     cancelUserInteractionOperationUseCase =
            //     GetIt.I.get<CancelUserInteractionOperationUseCase>();

            await _cancelUserInteractionOperationUseCase
                .execute()
                .whenComplete(() {
              debugPrint("CANCELLLL >>>>>");
              _errorHandler.handle(
                  // exception: state.lastRecoverableError!.description
                  operationType: OperationType.pinChange,
                  exception: ResultParameter.failure(
                    description:
                        state.lastRecoverableError!.description.toString(),
                  ));
            }).catchError((error) {});
          } else if (routeName == Routes.loginPinRoute) {
            await _cancelUserInteractionOperationUseCase
                .execute()
                .whenComplete(() {
              debugPrint("CANCEL LOGIN >>>>>");
              SaveLocal().saveRouteName(Routes.initRoute);
              _errorHandler.handle(
                  // exception: state.lastRecoverableError!.description
                  operationType: OperationType.authentication,
                  exception: ResultParameter.failure(
                    description:
                        state.lastRecoverableError!.description.toString(),
                  ));
            });
          } else {
            _errorHandler.handle(
                // exception: state.lastRecoverableError!.description
                operationType: OperationType.deregistration,
                exception: ResultParameter.failure(
                  description:
                      state.lastRecoverableError!.description.toString(),
                ));
          }
        } else {
          print("Working 2 ==> $routeName");
          if (routeName == Routes.initRoute) {
            _globalNavigationManager.pushPinLoginScreen();
          } else if (routeName == Routes.pinDeregisterRoute) {
            _globalNavigationManager.pushPinDeregScreen();
          }
          // else if (routeName == Routes.changeLoginPin) {
          //   _globalNavigationManager.pushChangePinScreen();
          // }
        }
        break;
      case PinMode.credentialChange:
        if (state.lastRecoverableError != null) {
          CancelPinOperationUseCase cancelPinOperationUseCase =
              GetIt.I<CancelPinOperationUseCase>();
          await cancelPinOperationUseCase.execute().catchError((error) {
            // _errorHandler.handle(error);
            debugPrint("Cancel PIN OPE ERROR ==> $error");
          });
        } else {
          _globalNavigationManager.pushChangePinScreen();
        }
        break;
    }
  }

  Future<void> _handleUserFingerPrintEvent(
    UserFingerPrintEvent event,
    Emitter<AppState> emit,
  ) async {
    await _fingerPrintListenForOsCredentialsUseCase.execute().then((_) {
      emit(InitialState());
    }).catchError((error) {
      _errorHandler.handle(exception: error);
    });
  }

  Future<void> _handleUserPinEvent(
    UserPinEvent event,
    Emitter<AppState> emit,
  ) async {}

  Future<void> _handleAuthenticationSucceeded(
    DomainAuthenticationSucceededState state,
  ) async {
    final username = state.username;
    AuthorizationProvider? authorizationProvider = state.authorizationProvider;
    if (authorizationProvider is CookieAuthorizationProvider) {
      // if a cookie auth provider is received, we need to fill in the correct uri
      final configuration = await _configurationLoader.load();
      String? path;
      if (state.operationType == OperationType.deregistration) {
        path = configuration.sdkConfiguration.deregistrationRequestPath;
      } else {
        _errorHandler.handle(exception: BusinessException.invalidState());
        return;
      }

      final uri = Uri.parse(configuration.sdkConfiguration.baseUrl + path);
      for (CookieContainer container
          in authorizationProvider.cookieContainers) {
        container.uri = uri;
      }
    }

    if (username == null || authorizationProvider == null) {
      _errorHandler.handle(exception: BusinessException.missingCookie());
      return;
    }

    if (state.operationType == OperationType.deregistration) {
    } else {
      _errorHandler.handle(exception: BusinessException.invalidState());
    }
  }

  Future<Set<Authenticator>> registeredAuthenticators(String username) async {
    final authenticators = await _authenticatorsUseCase.execute();
    return authenticators
        .where((element) => element.registration.isRegistered(username))
        .toSet();
  }

  @override
  Future<void> close() {
    _domainSubscription.cancel();
    return super.close();
  }
}
