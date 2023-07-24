import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/domain/operation/user_interaction_operation_state.dart';
import 'package:nomura_mobile/nomura/domain/usecases/select_authenticator_usecase.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

@Injectable(as: AuthenticatorSelector)
class AuthenticatorSelectorImpl implements AuthenticatorSelector {
  final SelectAuthenticatorUseCase selectAuthenticatorUseCase;
  final StateRepository<UserInteractionOperationState>
      _userInteractionOperationStateRepository;

  AuthenticatorSelectorImpl(
    this._userInteractionOperationStateRepository,
    this.selectAuthenticatorUseCase,
  );

  @override
  void selectAuthenticator(
    AuthenticatorSelectionContext context,
    AuthenticatorSelectionHandler handler,
  ) async {
    _userInteractionOperationStateRepository.save(
      UserInteractionOperationState(
        authenticatorSelectionContext: context,
        authenticatorSelectionHandler: handler,
      ),
    );

    var aaid = await SaveLocal().getSelector();
    var authList = context.authenticators.firstWhere(
      (element) => element.aaid.isBiometric,
    );
    
    SaveLocal().isSupportedByDevice(authList.isSupportedByHardware);
    debugPrint("SELECTOR LOG>>>$aaid ");
    selectAuthenticatorUseCase.execute(
      aaid.toString(),
      _userInteractionOperationStateRepository.state!,
    );
  }
}
