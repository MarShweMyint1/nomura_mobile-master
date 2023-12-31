// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain_state/domain_state.dart';

abstract class AppEvent {}

class AppDomainEvent extends AppEvent {
  DomainState domainState;

  AppDomainEvent(this.domainState);
}

class UserFingerPrintEvent extends AppEvent {}

class UserBiometricEvent extends AppEvent {
  final String title;
  final String description;
  final String cancelButtonText;

  UserBiometricEvent({
    required this.title,
    required this.description,
    required this.cancelButtonText,
  });
}

class UserPinEvent extends AppEvent {
  final PinAuthenticatorProtectionStatus? protectionStatus;
  final RecoverableError? lastRecoverableError;

  UserPinEvent({this.protectionStatus, this.lastRecoverableError});
}

class BiometricUserVerificationEvent extends AppEvent {
  final String title;
  final String description;
  final String cancelButtonText;

  BiometricUserVerificationEvent({
    required this.title,
    required this.description,
    required this.cancelButtonText,
  });
}
