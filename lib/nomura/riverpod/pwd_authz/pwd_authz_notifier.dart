// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/domain/usecases/pwd_authz_usecase.dart';
import 'package:nomura_mobile/nomura/riverpod/pwd_authz/pwd_authz_state.dart';

class PwdAuthzNotifier extends StateNotifier<PwdAuthzState> {
  final PwdAuthzUsecase _pwdAuthzUsecase;

  PwdAuthzNotifier(
      {required PwdAuthzUsecase pwdAuthzUsecase, PwdAuthzState? initState})
      : _pwdAuthzUsecase = pwdAuthzUsecase,
        super(initState ?? const PwdAuthzState.initial());

  void reset() => state = const PwdAuthzState.initial();

  Future<void> authzFunc() async {
    state = const PwdAuthzState.loading();
    final result = await _pwdAuthzUsecase.pwdAuthzUsecase();
    debugPrint("AUTHZ DATA REs ===>>> $result");
    result.fold((failure) {
      debugPrint("AUTHZ DATA Fail ===>>> $failure");
      state = PwdAuthzState.error(message: failure.toString());
    }, (success) => state = PwdAuthzState.data(data: success));
  }
}
