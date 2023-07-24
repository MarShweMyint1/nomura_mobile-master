// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:injectable/injectable.dart';
import 'package:nomura_mobile/nomura/domain/operation/pin_change_state.dart';
import 'package:nomura_mobile/nomura/domain/operation/pin_enrollment_state.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

abstract class CancelPinOperationUseCase {
  Future<void> execute();
}

@Injectable(as: CancelPinOperationUseCase)
class CancelPinOperationUseCaseImpl implements CancelPinOperationUseCase {
  final StateRepository<EnrollPinState> _enrollPinStateRepository;
  final StateRepository<PinChangeState> _changePinStateRepository;

  CancelPinOperationUseCaseImpl(
    this._enrollPinStateRepository,
    this._changePinStateRepository,
  );

  @override
  Future<void> execute() async {
    await _enrollPinStateRepository.state?.cancel();
    await _changePinStateRepository.state?.cancel();
  }
}
