// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:injectable/injectable.dart';
import 'package:nomura_mobile/nomura/data/cache/cache.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';
import 'package:nomura_mobile/nomura/domain/operation/pin_change_state.dart';
import 'package:nomura_mobile/nomura/domain/operation/pin_enrollment_state.dart';
import 'package:nomura_mobile/nomura/domain/operation/user_interaction_operation_state.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

abstract class StateRepositoryImpl<T> implements StateRepository<T> {
  final Cache<T> _cache;

  StateRepositoryImpl(this._cache);

  @override
  void save(T state) {
    _cache.put(state);
  }

  @override
  T? get state => _cache.item;

  @override
  void reset() {
    _cache.clear();
  }
}

@Injectable(as: StateRepository<UserInteractionOperationState>)
class UserInteractionOperationStateRepositoryImpl
    extends StateRepositoryImpl<UserInteractionOperationState> {
  UserInteractionOperationStateRepositoryImpl(
      Cache<UserInteractionOperationState> userInteractionOperationStateCache)
      : super(userInteractionOperationStateCache);
}

@Injectable(as: StateRepository<EnrollPinState>)
class EnrollPinStateRepositoryImpl extends StateRepositoryImpl<EnrollPinState> {
  EnrollPinStateRepositoryImpl(Cache<EnrollPinState> enrollPinStateCache)
      : super(enrollPinStateCache);
}

@Injectable(as: StateRepository<PinChangeState>)
class ChangePinStateRepositoryImpl extends StateRepositoryImpl<PinChangeState> {
  ChangePinStateRepositoryImpl(Cache<PinChangeState> changePinStateCache)
      : super(changePinStateCache);
}

@Injectable(as: StateRepository<OperationType>)
class OperationTypeRepositoryImpl extends StateRepositoryImpl<OperationType> {
  OperationTypeRepositoryImpl(Cache<OperationType> operationTypeCache)
      : super(operationTypeCache);
}
