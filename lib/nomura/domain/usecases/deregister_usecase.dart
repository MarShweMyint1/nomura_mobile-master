// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/domain/usecases/registration_usecase.dart';
import 'package:nomura_mobile/nomura/utils/constant_utils.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/batch_call/batch_call.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/client_provider/client_provider.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

abstract class DeregisterUseCase {
  Future<void> execute({
    required String username,
    required AuthorizationProvider authorizationProvider,
    required WidgetRef ref,
  });
}

@Injectable(as: DeregisterUseCase)
class DeregisterUseCaseImpl implements DeregisterUseCase {
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
    required WidgetRef ref,
  }) async {
    final batchCall = GetIt.I.get<BatchCall>();
    final List<SdkCall> batchCalls = [];
    _operationTypeRepository.reset();

    _operationTypeRepository.save(OperationType.deregistration);
    final isForgetPin = await SaveLocal().getIsForgetPin();
    if (isForgetPin ?? false) {
      print('forget pin true case in dereg');
      batchCalls.add(() async {
        await _clientProvider.client.operations.deregistration
            .username(username)
            .authorizationProvider(authorizationProvider)
            .aaid((isIOS ? "F1D0#1001" : "F1D0#0001"))
            .onSuccess(() async {
          debugPrint('Deregistration succeeded.');
          await SaveLocal().clearDeregister();
          RegistrationUseCase registrationUseCase =
              GetIt.I<RegistrationUseCase>();
          SaveLocal().saveSelector(isIOS ? "F1D0#1001" : "F1D0#0001");
          await registrationUseCase.execute(
            username: username,
            authorizationProvider: authorizationProvider,
            ref: ref,
            aaid: isIOS ? "F1D0#1001" : "F1D0#0001",
          );
        }).onError((error) {
          debugPrint('Deregistration failed: ${error.runtimeType}');
          batchCall.onOperationFinished(error: error);
        }).execute();
      });
    } else {
      print('forget pin false case in dereg');

      batchCalls.add(() async {
        await _clientProvider.client.operations.deregistration
            .username(username)
            .authorizationProvider(authorizationProvider)
            .onSuccess(() async {
          debugPrint('Deregistration succeeded.');
          await SaveLocal().clearDeregister();
          RegistrationUseCase registrationUseCase =
              GetIt.I<RegistrationUseCase>();
          SaveLocal().saveSelector(isIOS ? "F1D0#1001" : "F1D0#0001");
          await registrationUseCase.execute(
            username: username,
            authorizationProvider: authorizationProvider,
            ref: ref,
            aaid: isIOS ? "F1D0#1001" : "F1D0#0001",
          );
        }).onError((error) {
          debugPrint('Deregistration failed: ${error.runtimeType}');
          batchCall.onOperationFinished(error: error);
        }).execute();
      });
    }

    return batchCall.call(
      batchLength: batchCalls.length,
      batchCalls: batchCalls,
      operationType: OperationType.deregistration,
    );
  }
}
