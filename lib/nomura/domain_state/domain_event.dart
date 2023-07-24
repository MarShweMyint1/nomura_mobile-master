// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';

abstract class DomainEvent {}

class SelectAccountEvent extends DomainEvent {
  final OperationType operationType;
  final Set<Account> accounts;
  final String? transactionConfirmationData;

  SelectAccountEvent({
    required this.operationType,
    required this.accounts,
    this.transactionConfirmationData,
  });
}

class TransactionConfirmationEvent extends DomainEvent {
  final String transactionData;
  final Account? selectedAccount;
  final Set<Authenticator>? authenticators;

  TransactionConfirmationEvent({
    required this.transactionData,
    this.selectedAccount,
    this.authenticators,
  });
}

class SelectAuthenticatorEvent extends DomainEvent {
  final String aaid;
  final OperationType? operationType;

  SelectAuthenticatorEvent({
    this.operationType,
    required this.aaid,
  });
}

class ResultEvent extends DomainEvent {
  final String? username;
  final OperationType? operationType;
  final bool? isBiometricChange;

  ResultEvent({this.username, this.operationType, this.isBiometricChange});
}

class LoadingEvent extends DomainEvent {
  LoadingEvent();
}

class ForgetPinResultEvent extends DomainEvent {
  ForgetPinResultEvent();
}

class PinResultEvent extends DomainEvent {
  final String username;
  final OperationType operationType;
  final String aaid;
  PinResultEvent({
    required this.username,
    required this.operationType,
    required this.aaid,
  });
}

class FingerPrintResultEvent extends DomainEvent {
  final String username;
  final OperationType operationType;
  final String aaid;
  FingerPrintResultEvent({
    required this.username,
    required this.operationType,
    required this.aaid,
  });
}

class PinChageResultEvent extends DomainEvent {
  PinChageResultEvent();
}

class AuthenticationSucceededEvent extends DomainEvent {
  final OperationType operation;
  final AuthorizationProvider? authorizationProvider;
  final String? description;

  AuthenticationSucceededEvent({
    required this.operation,
    this.authorizationProvider,
    this.description,
  });
}

abstract class PinEvent extends DomainEvent {
  final PinAuthenticatorProtectionStatus? protectionStatus;

  PinEvent({
    required this.protectionStatus,
  });
}

class PinEnrollmentEvent extends PinEvent {
  final PinEnrollmentError? lastRecoverableError;

  PinEnrollmentEvent({
    required PinAuthenticatorProtectionStatus? protectionStatus,
    required OperationType operationType,
    required String aaid,
    this.lastRecoverableError,
  }) : super(
          protectionStatus: protectionStatus,
        );
}

class PinUserVerificationEvent extends PinEvent {
  final PinUserVerificationError? lastRecoverableError;

  PinUserVerificationEvent({
    required PinAuthenticatorProtectionStatus protectionStatus,
    this.lastRecoverableError,
  }) : super(protectionStatus: protectionStatus);
}

class PinChangeEvent extends PinEvent {
  final PinChangeRecoverableError? lastRecoverableError;

  PinChangeEvent({
    required PinAuthenticatorProtectionStatus protectionStatus,
    this.lastRecoverableError,
  }) : super(protectionStatus: protectionStatus);
}

class FingerPrintUserVerificationEvent extends DomainEvent {}

class BiometricUserVerificationEvent extends DomainEvent {
  final OperationType operationType;
  final String aaid;

  BiometricUserVerificationEvent({
    required this.operationType,
    required this.aaid,
  });
}
