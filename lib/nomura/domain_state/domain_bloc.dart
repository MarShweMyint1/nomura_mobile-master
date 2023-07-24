// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';
import 'package:nomura_mobile/nomura/domain/operation/user_interaction_operation_state.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/blocs/behaviour_subject_mixin.dart';
import 'package:nomura_mobile/nomura/domain_state/domain_event.dart';
import 'package:nomura_mobile/nomura/domain_state/domain_state.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

@singleton
class DomainBloc extends Bloc<DomainEvent, DomainState>
    with BehaviorSubjectMixin<DomainEvent, DomainState> {
  final StateRepository<UserInteractionOperationState>
      _userInteractionOperationStateRepository;

  DomainBloc(
    this._userInteractionOperationStateRepository,
  ) : super(DomainInitialState()) {
    on<SelectAccountEvent>(_handleSelectAccount);
    on<SelectAuthenticatorEvent>(_handleSelectAuthenticator);
    on<TransactionConfirmationEvent>(_handleTransactionConfirmation);
    on<ResultEvent>(_handleResult);
    on<PinResultEvent>(_handlePinResult);
    on<PinEnrollmentEvent>(_handlePinEnrollment);
    on<PinUserVerificationEvent>(_handlePinVerification);
    on<FingerPrintUserVerificationEvent>(_handleFingerPrintVerify);
    on<BiometricUserVerificationEvent>(_handleBiometricVerify);
    on<PinChangeEvent>(_handlePinChange);
    on<PinChageResultEvent>(_handlePinChangeResultEvent);
    on<AuthenticationSucceededEvent>(_handleAuthenticationSucceeded);
    on<ForgetPinResultEvent>(_handleForgetPinResultEvent);
    on<FingerPrintResultEvent>(_handleFingerPrintResult);
  }

  Future<void> _handleForgetPinResultEvent(
    ForgetPinResultEvent event,
    Emitter<DomainState> emit,
  ) async {
    emit(
      DomainResetPinResultState(),
    );
  }

  Future<void> _handleSelectAccount(
    SelectAccountEvent event,
    Emitter<DomainState> emit,
  ) async {
    emit(
      DomainSelectAccountState(
        operationType: event.operationType,
        accounts: event.accounts,
        // transactionConfirmationData: event.transactionConfirmationData,
      ),
    );
  }

  Future<void> _handleSelectAuthenticator(
    SelectAuthenticatorEvent event,
    Emitter<DomainState> emit,
  ) async {
    emit(
      DomainSelectAuthenticatorState(
        aaid: event.aaid,
        operationType: event.operationType,
      ),
    );
  }

  Future<void> _handleTransactionConfirmation(
    TransactionConfirmationEvent event,
    Emitter<DomainState> emit,
  ) async {
    emit(
      DomainTransactionConfirmationState(
        transactionData: event.transactionData,
        selectedAccount: event.selectedAccount,
        authenticators: event.authenticators,
      ),
    );
  }

  Future<void> _handlePinEnrollment(
    PinEnrollmentEvent event,
    Emitter<DomainState> emit,
  ) async {
    emit(
      DomainPinState.enrollment(
        lastRecoverableError: event.lastRecoverableError,
        protectionStatus: event.protectionStatus,
      ),
    );
  }

  Future<void> _handlePinVerification(
    PinUserVerificationEvent event,
    Emitter<DomainState> emit,
  ) async {
    emit(
      DomainPinState.verification(
        lastRecoverableError: event.lastRecoverableError,
        protectionStatus: event.protectionStatus,
      ),
    );
  }

  Future<void> _handleFingerPrintVerify(
    FingerPrintUserVerificationEvent event,
    Emitter<DomainState> emit,
  ) async {
    emit(DomainVerifyFingerPrintState());
  }

  Future<void> _handleBiometricVerify(
    BiometricUserVerificationEvent event,
    Emitter<DomainState> emit,
  ) async {
    emit(DomainVerifyBiometricState());
  }

  Future<void> _handlePinChange(
    PinChangeEvent event,
    Emitter<DomainState> emit,
  ) async {
    emit(
      DomainPinState.pinChange(
        lastRecoverableError: event.lastRecoverableError,
        protectionStatus: event.protectionStatus,
      ),
    );
  }

  Future<void> _handlePinChangeResultEvent(
    PinChageResultEvent event,
    Emitter<DomainState> emit,
  ) async {
    emit(
      DomainPinChageResultState(),
    );
  }

  Future<void> _handleResult(
    ResultEvent event,
    Emitter<DomainState> emit,
  ) async {
    // _userInteractionOperationStateRepository.reset();
    emit(DomainResultState(
        username: event.username,
        operationType: event.operationType,
        isBiometricChange: event.isBiometricChange));
  }

  Future<void> _handlePinResult(
    PinResultEvent event,
    Emitter<DomainState> emit,
  ) async {
    _userInteractionOperationStateRepository.reset();
    emit(DomainPinResultState(
      username: event.username,
      aaid: event.aaid,
      operationType: event.operationType,
    ));
  }

  Future<void> _handleFingerPrintResult(
    FingerPrintResultEvent event,
    Emitter<DomainState> emit,
  ) async {
    _userInteractionOperationStateRepository.reset();
    emit(DomainFingerPrintResultState(
      username: event.username,
      aaid: event.aaid,
      operationType: event.operationType,
    ));
  }

  Future<void> _handleAuthenticationSucceeded(
    AuthenticationSucceededEvent event,
    Emitter<DomainState> emit,
  ) async {
    if (event.operation == OperationType.deregistration) {
      final username = _userInteractionOperationStateRepository
          .state?.authenticatorSelectionContext?.account.username;
      emit(
        DomainAuthenticationSucceededState(
          operationType: event.operation,
          username: username,
          authorizationProvider: event.authorizationProvider,
        ),
      );
    } else {
      debugPrint('Succsss Login::::::');
      emit(DomainLoginPinResultState());
    }
    _userInteractionOperationStateRepository.reset();
  }
}
