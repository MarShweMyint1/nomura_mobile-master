import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/domain/usecases/change_pin_usecase.dart';
import 'package:nomura_mobile/nomura/riverpod/pin_change/pin_change_state.dart';
part 'pin_change_notifier.dart';

ChangePinUseCase _changePinUseCase = GetIt.I<ChangePinUseCase>();
final pinChangeNotifierProvider =
    StateNotifierProvider<PinChangeNotifier, PinChangeState>(
  (ref) => PinChangeNotifier(
    changePinUseCase: _changePinUseCase,
  ),
);
