import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/domain/usecases/deregister_usecase.dart';
import 'package:nomura_mobile/nomura/riverpod/deregistration/deregistration_state.dart';
part 'deregistration_notifier.dart';

DeregisterUseCase _deregisterUseCase = GetIt.I<DeregisterUseCase>();
final deregistrationNotifierProvider =
    StateNotifierProvider<DeregistrationNotifier, DeregistrationState>(
  (ref) => DeregistrationNotifier(
    deregisterUseCase: _deregisterUseCase,
  ),
);
