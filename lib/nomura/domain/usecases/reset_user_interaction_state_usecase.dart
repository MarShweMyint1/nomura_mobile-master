// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:injectable/injectable.dart';
import 'package:nomura_mobile/nomura/domain/operation/user_interaction_operation_state.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

abstract class ResetUserInteractionStateUseCase {
  void execute();
}

@Injectable(as: ResetUserInteractionStateUseCase)
class ResetUserInteractionStateUseCaseImpl
    extends ResetUserInteractionStateUseCase {
  final StateRepository<UserInteractionOperationState>
      _userInteractionOperationStateRepository;

  ResetUserInteractionStateUseCaseImpl(
    this._userInteractionOperationStateRepository,
  );

  @override
  void execute() {
    _userInteractionOperationStateRepository.reset();
  }
}
