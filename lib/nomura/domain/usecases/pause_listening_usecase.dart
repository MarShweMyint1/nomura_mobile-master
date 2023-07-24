// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:nomura_mobile/nomura/domain/operation/user_interaction_operation_state.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

abstract class PauseListeningUseCase {
  Future<void> execute();
}

@Injectable(as: PauseListeningUseCase)
class PauseListeningUseCaseImpl extends PauseListeningUseCase {
  final StateRepository<UserInteractionOperationState>
      _userInteractionOperationStateRepository;

  PauseListeningUseCaseImpl(
    this._userInteractionOperationStateRepository,
  );

  @override
  Future<void> execute() async {
    final osAuthenticationListenHandler =
        _userInteractionOperationStateRepository
            .state?.osAuthenticationListenHandler;
    await osAuthenticationListenHandler?.pauseListening();
    debugPrint("Listening paused.");
  }
}
