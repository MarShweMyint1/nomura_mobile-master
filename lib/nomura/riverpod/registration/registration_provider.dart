import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/domain/usecases/registration_usecase.dart';
import 'package:nomura_mobile/nomura/riverpod/registration/registration_state.dart';
part 'registration_notifier.dart';

RegistrationUseCase _registrationUseCase = GetIt.I<RegistrationUseCase>();
final registrationNotifierProvider =
    StateNotifierProvider<RegistrationNotifier, RegistrationState>(
  (ref) => RegistrationNotifier(
    registrationUseCase: _registrationUseCase,
  ),
);
