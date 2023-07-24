import 'package:injectable/injectable.dart';
import 'package:nomura_mobile/nomura/domain/operation/pin_enrollment_state.dart';
import 'package:nomura_mobile/nomura/errors/error_exception.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

abstract class SetPinUseCase {
  Future<void> execute(String firstCredentials);
}

@Injectable(as: SetPinUseCase)
class SetPinUseCaseImpl implements SetPinUseCase {
  final StateRepository<EnrollPinState> _pinEnrollmentStateRepository;

  SetPinUseCaseImpl(this._pinEnrollmentStateRepository);

  @override
  Future<void> execute(String firstCredentials) async {
    final currentState = _pinEnrollmentStateRepository.state;
    if (currentState is EnrollPinState) {
      await currentState.handler.pin(firstCredentials);
    } else {
      throw BusinessException.invalidState();
    }
  }
}
