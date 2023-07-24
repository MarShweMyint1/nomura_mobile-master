import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/domain/usecases/biometric_listen_for_os_credentials_usecase.dart';
import 'package:nomura_mobile/nomura/riverpod/biometric_entry/biometric_entry_state.dart';
part 'biometric_entry_notifier.dart';

BiometricListenForOsCredentialsUseCase _biometricListenForOsCredentialsUseCase =
    GetIt.I<BiometricListenForOsCredentialsUseCase>();
final biometricEntryNotifierProvider =
    StateNotifierProvider<BiometricEntryNotifier, BiometricEntryState>(
  (ref) => BiometricEntryNotifier(
    biometricListenForOsCredentialsUseCase:
        _biometricListenForOsCredentialsUseCase,
  ),
);
