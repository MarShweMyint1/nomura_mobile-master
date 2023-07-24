import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/domain/usecases/verify_pin_usecase.dart';
import 'package:nomura_mobile/nomura/riverpod/pin_verify/pin_verify_state.dart';
part 'pin_verify_notifier.dart';

VerifyPinUseCase _verifyPinUseCase = GetIt.I<VerifyPinUseCase>();
final pinVerifyNotifierProvider =
    StateNotifierProvider<PinVerifyNotifier, PinVerifyState>(
  (ref) => PinVerifyNotifier(
    verifyPinUseCase: _verifyPinUseCase,
  ),
);
