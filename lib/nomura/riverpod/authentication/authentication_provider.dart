import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/domain/usecases/authenticate_usecase.dart';
import 'package:nomura_mobile/nomura/riverpod/authentication/authentication_state.dart';
import 'package:nomura_mobile/nomura/utils/enumeration.dart';
part 'authentication_notifier.dart';

AuthenticateUseCase _authenticateUseCase = GetIt.I<AuthenticateUseCase>();
final authenticationNotifierProvider = StateNotifierProvider.autoDispose<
    AuthenticationNotifier, AuthenticationState>(
  (ref) => AuthenticationNotifier(
    authenticateUseCase: _authenticateUseCase,
  ),
);
