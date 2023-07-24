// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/batch_call/batch_call.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/client_provider/client_provider.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

abstract class DeregisterAllUseCase {
  Future<void> execute({
    required String username,
    required AuthorizationProvider authorizationProvider,
  });
}

@Injectable(as: DeregisterAllUseCase)
class DeregisterUseCaseImpl implements DeregisterAllUseCase {
  final ClientProvider _clientProvider;
  final StateRepository<OperationType> _operationTypeRepository;

  DeregisterUseCaseImpl(
    this._clientProvider,
    this._operationTypeRepository,
  );

  @override
  Future<void> execute({
    required String username,
    required AuthorizationProvider authorizationProvider,
  }) async {
    final batchCall = GetIt.I.get<BatchCall>();
    final List<SdkCall> batchCalls = [];
    _operationTypeRepository.reset();
    debugPrint(
        "PROVIDER ===>> $username || $authorizationProvider || ${_clientProvider.client.operations}");
    _operationTypeRepository.save(OperationType.deregistration);

    batchCalls.add(() async {
      _clientProvider.client.operations.deregistration
          .username(username)
          .authorizationProvider(authorizationProvider)
          .onSuccess(() async {
            debugPrint('Deregistration succeeded.');
            batchCall.onOperationFinished();
            
          })
          .onError((error) {
            debugPrint('Deregistration failed: ${error.runtimeType}');
            batchCall.onOperationFinished(error: error);
          })
          .execute()
          .catchError((onError) {
            debugPrint('Deregistration failed 11: ${onError.runtimeType}');
          });
      // return await deregistration.execute();
    });

    return batchCall.call(
      batchLength: batchCalls.length,
      batchCalls: batchCalls,
      operationType: OperationType.deregistration,
    );
  }
}
