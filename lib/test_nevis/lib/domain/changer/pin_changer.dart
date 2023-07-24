// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/pin_change_state.dart';
import 'package:nomura_mobile/nomura/domain_state/domain_bloc.dart';
import 'package:nomura_mobile/nomura/domain_state/domain_event.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

@Injectable(as: PinChanger)
class PinChangerImpl extends PinChanger {
  final DomainBloc _domainBloc;
  final StateRepository<PinChangeState> _stateRepository;

  PinChangerImpl(
    this._domainBloc,
    this._stateRepository,
  );

  @override
  void changePin(PinChangeContext context, PinChangeHandler handler) {
    if (context.lastRecoverableError != null) {
      debugPrint(
          'Pin Change Error ===>> ${context.lastRecoverableError.runtimeType} || ${context.lastRecoverableError?.description} || ${context.lastRecoverableError}');
    }
    _stateRepository.save(PinChangeState(context, handler));
    final event = PinChangeEvent(
      lastRecoverableError: context.lastRecoverableError,
      protectionStatus: context.authenticatorProtectionStatus,
    );
    debugPrint('protection status =======> ${event.protectionStatus}');
    _domainBloc.add(event);
  }
}
