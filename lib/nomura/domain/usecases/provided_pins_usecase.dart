// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:nomura_mobile/nomura/domain/operation/pin_change_state.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

abstract class ProvidedPinsUseCase {
  Future<void> execute({
    required String currentPin,
    required String newPin,
  });
}

@Injectable(as: ProvidedPinsUseCase)
class ProvidedPinsUseCaseImpl implements ProvidedPinsUseCase {
  final StateRepository<PinChangeState> _stateRepository;
  // final ErrorHandler _errorHandler;

  ProvidedPinsUseCaseImpl(
    this._stateRepository,
    // this._errorHandler,
  );

  @override
  Future<void> execute(
      {required String currentPin, required String newPin}) async {
        debugPrint("EXECUTE CHANGE PIN ===>>> $currentPin || $newPin");
    final state = _stateRepository.state;
    if (state == null) {
      // _errorHandler.handle(BusinessException.invalidState());
      debugPrint("EXECUTE CHANGE PIN STATE NULL ===>>>");
      return;
    }
    debugPrint('EXECUTE CHANGE PIN STATE ==>> $state');
    state.handler.pins(currentPin, newPin);
  }
}
