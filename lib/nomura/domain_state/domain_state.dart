// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:flutter/material.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/model/pin/pin_mode.dart';

@immutable
abstract class DomainState {}

class DomainInitialState extends DomainState {}

class DomainLoadingState extends DomainState {}

@immutable
abstract class DomainVerifyState extends DomainState {}

@immutable
abstract class DomainSetUpState extends DomainState {}

class DomainPinState extends DomainVerifyState {
  final PinMode mode;
  final RecoverableError? lastRecoverableError;
  final PinAuthenticatorProtectionStatus? protectionStatus;
  final String? aaid;

  DomainPinState.enrollment({
    required this.protectionStatus,
    this.lastRecoverableError,
    this.aaid,
  }) : mode = PinMode.enrollment;

  DomainPinState.verification({
    required this.protectionStatus,
    this.lastRecoverableError,
    this.aaid,
  }) : mode = PinMode.verification;

  DomainPinState.pinChange({
    required this.protectionStatus,
    this.lastRecoverableError,
    this.aaid,
  }) : mode = PinMode.credentialChange;
}

class DomainVerifyFingerPrintState extends DomainVerifyState {}

class DomainVerifyBiometricState extends DomainSetUpState {
  final OperationType? operationType;
  final String? aaid;

  DomainVerifyBiometricState({this.operationType, this.aaid});
}

class DomainSelectAuthenticatorState extends DomainState {
  final OperationType? operationType;
  final String aaid;

  DomainSelectAuthenticatorState({
    required this.aaid,
    required this.operationType,
  });
}

class DomainResultState extends DomainState {
  final OperationType? operationType;
  final String? username;
  final bool? isBiometricChange;

  DomainResultState(
      {this.username, required this.operationType, this.isBiometricChange});
}

class DomainLoginPinResultState extends DomainState {
  DomainLoginPinResultState();
}

class DomainResetPinResultState extends DomainState {
  DomainResetPinResultState();
}

class DomainPinChageResultState extends DomainState {
  DomainPinChageResultState();
}

class DomainPinResultState extends DomainState {
  final String username;
  final OperationType operationType;
  final String aaid;

  DomainPinResultState({
    required this.username,
    required this.operationType,
    required this.aaid,
  });
}

class DomainFingerPrintResultState extends DomainState {
  final String username;
  final OperationType operationType;
  final String aaid;

  DomainFingerPrintResultState({
    required this.username,
    required this.operationType,
    required this.aaid,
  });
}

class DomainSelectAccountState extends DomainState {
  final OperationType operationType;
  final Set<Account> accounts;
  // final String? transactionConfirmationData;

  DomainSelectAccountState({
    required this.operationType,
    required this.accounts,
    // this.transactionConfirmationData,
  });
}

class DomainTransactionConfirmationState extends DomainState {
  final String transactionData;
  final Account? selectedAccount;
  final Set<Authenticator>? authenticators;

  DomainTransactionConfirmationState({
    required this.transactionData,
    this.selectedAccount,
    this.authenticators,
  });
}

class DomainAuthenticationSucceededState extends DomainState {
  final OperationType operationType;
  final String? username;
  final AuthorizationProvider? authorizationProvider;

  DomainAuthenticationSucceededState({
    required this.operationType,
    required this.username,
    required this.authorizationProvider,
  });
}
