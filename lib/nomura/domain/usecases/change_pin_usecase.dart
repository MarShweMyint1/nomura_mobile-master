// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/data/params/result_parameter.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';
import 'package:nomura_mobile/nomura/domain/operation/pin_change_state.dart';
import 'package:nomura_mobile/nomura/domain_state/domain_bloc.dart';
import 'package:nomura_mobile/nomura/domain_state/domain_event.dart';
import 'package:nomura_mobile/nomura/errors/error_handler.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/client_provider/client_provider.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

abstract class ChangePinUseCase {
  Future<void> execute({
    required String username,
    required WidgetRef ref,
  });
}

@Injectable(as: ChangePinUseCase)
class ChangePinUseCaseImpl implements ChangePinUseCase {
  final ClientProvider _clientProvider;
  final PinChanger _pinChanger;
  final DomainBloc _domainBloc;
  final StateRepository<OperationType> _operationTypeRepository;
  final StateRepository<PinChangeState> _pinChangeStateRepository;
  final ErrorHandler _errorHandler;

  ChangePinUseCaseImpl(
    this._clientProvider,
    this._pinChanger,
    this._domainBloc,
    this._operationTypeRepository,
    this._pinChangeStateRepository,
    this._errorHandler,
  );

  @override
  Future<void> execute({
    required String username,
    required WidgetRef ref,
  }) async {
    _operationTypeRepository.save(OperationType.pinChange);
    await _clientProvider.client.operations.pinChange
        .username(username)
        .pinChanger(_pinChanger)
        .onSuccess(() {
      debugPrint('Pin change succeeded.');
      _domainBloc.add(PinChageResultEvent());
      _pinChangeStateRepository.reset();
    }).onError((error) {
      debugPrint('Pin change failed: ${error.description}');
      bool cancel = ref.watch(pinChangeCancelProvider);
      if (cancel) {
        _errorHandler.handle(
            // exception: state.lastRecoverableError!.description
            exception: ResultParameter.failure(
              description: "Change Login PIN Cancelled!",
            ),
            operationType: OperationType.pinChange);
        ref.read(pinChangeCancelProvider.notifier).update(
              (state) => false,
            );
      } else {
        _errorHandler.handle(
            // exception: state.lastRecoverableError!.description
            exception: ResultParameter.failure(
                description: "Change Login PIN Failed!",
                ),operationType: OperationType.pinChange);
      }
      // _errorHandler.handle(error);

      _pinChangeStateRepository.reset();
    }).execute();
  }
}
