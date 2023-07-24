import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/domain/usecases/set_pin_usecase.dart';
import 'package:nomura_mobile/nomura/riverpod/pin_entry/pin_entry_state.dart';
part 'pin_entry_notifier.dart';

SetPinUseCase _setPinUseCase = GetIt.I<SetPinUseCase>();
final pinEntryNotifierProvider =
    StateNotifierProvider<PinEntryNotifier, PinEntryState>(
  (ref) => PinEntryNotifier(
    setPinUseCase: _setPinUseCase,
  ),
);
