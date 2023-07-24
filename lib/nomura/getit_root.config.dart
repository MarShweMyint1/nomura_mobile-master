// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart'
    as _i29;

import '../test_nevis/lib/domain/batch_call/batch_call.dart' as _i43;
import '../test_nevis/lib/domain/changer/pin_changer.dart' as _i32;
import '../test_nevis/lib/domain/client_provider/client_provider.dart' as _i45;
import '../test_nevis/lib/domain/repository/deep_link_repository.dart' as _i13;
import '../test_nevis/lib/domain/repository/login_repository.dart' as _i16;
import '../test_nevis/lib/domain/repository/state_repository.dart' as _i20;
import '../test_nevis/lib/domain/selector/account_selector.dart' as _i41;
import '../test_nevis/lib/domain/validation/account_validator.dart' as _i3;
import 'app_state/app_bloc.dart' as _i63;
import 'configuration/configuration_loader.dart' as _i10;
import 'data/cache/cache.dart' as _i4;
import 'data/cache/state_cache.dart' as _i6;
import 'data/deep_link/deep_link_datasource.dart' as _i12;
import 'data/irepositories/deep_link_repository_impl.dart' as _i14;
import 'data/irepositories/login_repository_impl.dart' as _i17;
import 'data/irepositories/state_repository_impl.dart' as _i21;
import 'data/login/login_datasource.dart' as _i15;
import 'domain/enroller/pin_enroller.dart' as _i33;
import 'domain/local_data/local_data_bloc.dart' as _i51;
import 'domain/operation/operation_type.dart' as _i7;
import 'domain/operation/pin_change_state.dart' as _i8;
import 'domain/operation/pin_enrollment_state.dart' as _i9;
import 'domain/operation/user_interaction_operation_state.dart' as _i5;
import 'domain/usecases/authenticate_usecase.dart' as _i57;
import 'domain/usecases/authenticator_selector.dart' as _i42;
import 'domain/usecases/authenticators_usecase.dart' as _i58;
import 'domain/usecases/biometric_listen_for_os_credentials_usecase.dart'
    as _i23;
import 'domain/usecases/biometric_usecase.dart' as _i59;
import 'domain/usecases/cancel_pin_operation_usecase.dart' as _i24;
import 'domain/usecases/cancel_user_interaction_operation_usecase.dart' as _i25;
import 'domain/usecases/change_device_information_usecase.dart' as _i60;
import 'domain/usecases/change_pin_authenticate_usecase.dart' as _i61;
import 'domain/usecases/change_pin_usecase.dart' as _i62;
import 'domain/usecases/create_device_information_usecase.dart' as _i11;
import 'domain/usecases/deregister_all_usecase.dart' as _i46;
import 'domain/usecases/deregister_usecase.dart' as _i47;
import 'domain/usecases/deregstration_authenticate_usecase.dart' as _i48;
import 'domain/usecases/device_information_usecase.dart' as _i49;
import 'domain/usecases/fingerprint_listen_for_os_credentials_usecase.dart'
    as _i28;
import 'domain/usecases/forget_pin_authenticate_usecase.dart' as _i50;
import 'domain/usecases/login_usecase.dart' as _i18;
import 'domain/usecases/oob_payload_decode_usecase.dart' as _i52;
import 'domain/usecases/oob_process_usecase.dart' as _i53;
import 'domain/usecases/pause_listening_usecase.dart' as _i31;
import 'domain/usecases/provided_pins_usecase.dart' as _i35;
import 'domain/usecases/registered_accounts_usecase.dart' as _i54;
import 'domain/usecases/registration_operation_change_sdk_usecase.dart' as _i55;
import 'domain/usecases/registration_usecase.dart' as _i56;
import 'domain/usecases/reset_user_interaction_state_usecase.dart' as _i36;
import 'domain/usecases/resume_listening_usecase.dart' as _i37;
import 'domain/usecases/select_account_usecase.dart' as _i38;
import 'domain/usecases/select_authenticator_usecase.dart' as _i39;
import 'domain/usecases/set_pin_usecase.dart' as _i40;
import 'domain/usecases/verify_pin_usecase.dart' as _i22;
import 'domain/verifier/biometric_user_verifier.dart' as _i44;
import 'domain/verifier/fingerprint_user_verifier.dart' as _i30;
import 'domain/verifier/pin_user_verifier.dart' as _i34;
import 'domain_state/domain_bloc.dart' as _i26;
import 'errors/error_handler.dart' as _i27;
import 'route_manager.dart' as _i19;

const String _identitySuite = 'identitySuite';

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AccountValidator>(() => _i3.AccountValidatorImpl());
  gh.singleton<_i4.Cache<_i5.UserInteractionOperationState>>(
      _i6.UserInteractionOperationStateCacheImpl());
  gh.singleton<_i4.Cache<_i7.OperationType>>(_i6.OperationTypeCacheImpl());
  gh.singleton<_i4.Cache<_i8.PinChangeState>>(_i6.ChangePinStateCacheImpl());
  gh.singleton<_i4.Cache<_i9.EnrollPinState>>(_i6.EnrollPinStateCacheImpl());
  gh.singleton<_i10.ConfigurationLoader>(
    _i10.IdentitySuiteConfigurationLoader(),
    registerFor: {_identitySuite},
  );
  gh.factory<_i11.CreateDeviceInformationUseCase>(
      () => _i11.CreateDeviceInformationUseCaseImpl());
  gh.singleton<_i12.DeepLinkDataSource>(_i12.DeepLinkDataSourceImpl());
  gh.factory<_i13.DeepLinkRepository>(
      () => _i14.DeepLinkRepositoryImpl(gh<_i12.DeepLinkDataSource>()));
  gh.factory<_i15.LoginDataSource>(() => _i15.LoginDataSourceImpl());
  gh.factory<_i16.LoginRepository>(
      () => _i17.LoginRepositoryImpl(gh<_i15.LoginDataSource>()));
  gh.factory<_i18.LoginUseCase>(
      () => _i18.LoginUseCaseImpl(gh<_i16.LoginRepository>()));
  gh.singleton<_i19.RouteGenerator>(_i19.RouteGenerator());
  gh.factory<_i20.StateRepository<_i9.EnrollPinState>>(() =>
      _i21.EnrollPinStateRepositoryImpl(gh<_i4.Cache<_i9.EnrollPinState>>()));
  gh.factory<_i20.StateRepository<_i7.OperationType>>(() =>
      _i21.OperationTypeRepositoryImpl(gh<_i4.Cache<_i7.OperationType>>()));
  gh.factory<_i20.StateRepository<_i5.UserInteractionOperationState>>(() =>
      _i21.UserInteractionOperationStateRepositoryImpl(
          gh<_i4.Cache<_i5.UserInteractionOperationState>>()));
  gh.factory<_i20.StateRepository<_i8.PinChangeState>>(() =>
      _i21.ChangePinStateRepositoryImpl(gh<_i4.Cache<_i8.PinChangeState>>()));
  gh.factory<_i22.VerifyPinUseCase>(() => _i22.VerifyPinUseCaseImpl(
      gh<_i20.StateRepository<_i5.UserInteractionOperationState>>()));
  gh.factory<_i23.BiometricListenForOsCredentialsUseCase>(() =>
      _i23.BiometricListenForOsCredentialsUseCaseImpl(
          gh<_i20.StateRepository<_i5.UserInteractionOperationState>>()));
  gh.factory<_i24.CancelPinOperationUseCase>(
      () => _i24.CancelPinOperationUseCaseImpl(
            gh<_i20.StateRepository<_i9.EnrollPinState>>(),
            gh<_i20.StateRepository<_i8.PinChangeState>>(),
          ));
  gh.factory<_i25.CancelUserInteractionOperationUseCase>(() =>
      _i25.CancelUserInteractionOperationUseCaseImpl(
          gh<_i20.StateRepository<_i5.UserInteractionOperationState>>()));
  gh.singleton<_i26.DomainBloc>(_i26.DomainBloc(
      gh<_i20.StateRepository<_i5.UserInteractionOperationState>>()));
  gh.factory<_i27.ErrorHandler>(() => _i27.ErrorHandlerImpl(
        gh<_i19.RouteGenerator>(),
        gh<_i20.StateRepository<_i5.UserInteractionOperationState>>(),
      ));
  gh.factory<_i28.FingerPrintListenForOsCredentialsUseCase>(() =>
      _i28.FingerPrintListenForOsCredentialsUseCaseImpl(
          gh<_i20.StateRepository<_i5.UserInteractionOperationState>>()));
  gh.factory<_i29.FingerprintUserVerifier>(
      () => _i30.FingerprintUserVerifierImpl(
            gh<_i26.DomainBloc>(),
            gh<_i20.StateRepository<_i5.UserInteractionOperationState>>(),
          ));
  gh.factory<_i31.PauseListeningUseCase>(() => _i31.PauseListeningUseCaseImpl(
      gh<_i20.StateRepository<_i5.UserInteractionOperationState>>()));
  gh.factory<_i29.PinChanger>(() => _i32.PinChangerImpl(
        gh<_i26.DomainBloc>(),
        gh<_i20.StateRepository<_i8.PinChangeState>>(),
      ));
  gh.factory<_i29.PinEnroller>(() => _i33.PinEnrollerImpl(
        gh<_i20.StateRepository<_i9.EnrollPinState>>(),
        gh<_i26.DomainBloc>(),
      ));
  gh.factory<_i29.PinUserVerifier>(() => _i34.PinUserVerifierImpl(
        gh<_i26.DomainBloc>(),
        gh<_i27.ErrorHandler>(),
        gh<_i20.StateRepository<_i5.UserInteractionOperationState>>(),
      ));
  gh.factory<_i35.ProvidedPinsUseCase>(() => _i35.ProvidedPinsUseCaseImpl(
      gh<_i20.StateRepository<_i8.PinChangeState>>()));
  gh.factory<_i36.ResetUserInteractionStateUseCase>(() =>
      _i36.ResetUserInteractionStateUseCaseImpl(
          gh<_i20.StateRepository<_i5.UserInteractionOperationState>>()));
  gh.factory<_i37.ResumeListeningUseCase>(() => _i37.ResumeListeningUseCaseImpl(
      gh<_i20.StateRepository<_i5.UserInteractionOperationState>>()));
  gh.factory<_i38.SelectAccountUseCase>(() => _i38.SelectAccountUseCaseImpl(
      gh<_i20.StateRepository<_i5.UserInteractionOperationState>>()));
  gh.factory<_i39.SelectAuthenticatorUseCase>(() =>
      _i39.SelectAuthenticatorUseCaseImpl(
          gh<_i20.StateRepository<_i5.UserInteractionOperationState>>()));
  gh.factory<_i40.SetPinUseCase>(() =>
      _i40.SetPinUseCaseImpl(gh<_i20.StateRepository<_i9.EnrollPinState>>()));
  gh.factory<_i29.AccountSelector>(() => _i41.AccountSelectorImpl(
        gh<_i26.DomainBloc>(),
        gh<_i20.StateRepository<_i5.UserInteractionOperationState>>(),
        gh<_i3.AccountValidator>(),
      ));
  gh.factory<_i29.AuthenticatorSelector>(() => _i42.AuthenticatorSelectorImpl(
        gh<_i20.StateRepository<_i5.UserInteractionOperationState>>(),
        gh<_i39.SelectAuthenticatorUseCase>(),
      ));
  gh.factory<_i43.BatchCall>(() => _i43.BatchCallImpl(gh<_i26.DomainBloc>()));
  gh.factory<_i29.BiometricUserVerifier>(() => _i44.BiometricUserVerifierImpl(
        gh<_i26.DomainBloc>(),
        gh<_i20.StateRepository<_i5.UserInteractionOperationState>>(),
      ));
  gh.factory<_i45.ClientProvider>(() => _i45.ClientProviderImpl(
        gh<_i20.StateRepository<_i7.OperationType>>(),
        gh<_i27.ErrorHandler>(),
      ));
  gh.factory<_i46.DeregisterAllUseCase>(() => _i46.DeregisterUseCaseImpl(
        gh<_i45.ClientProvider>(),
        gh<_i20.StateRepository<_i7.OperationType>>(),
      ));
  gh.factory<_i47.DeregisterUseCase>(() => _i47.DeregisterUseCaseImpl(
        gh<_i45.ClientProvider>(),
        gh<_i20.StateRepository<_i7.OperationType>>(),
      ));
  gh.factory<_i48.DeregstrationAuthenticateUsecase>(
      () => _i48.DeregstrationAuthenticateUsecaseImpl(
            gh<_i45.ClientProvider>(),
            gh<_i29.AuthenticatorSelector>(),
            gh<_i29.BiometricUserVerifier>(),
            gh<_i29.FingerprintUserVerifier>(),
            gh<_i29.PinUserVerifier>(),
            gh<_i20.StateRepository<_i7.OperationType>>(),
            gh<_i27.ErrorHandler>(),
          ));
  gh.factory<_i49.DeviceInformationUseCase>(
      () => _i49.DeviceInformationUseCaseImpl(gh<_i45.ClientProvider>()));
  gh.factory<_i50.ForgetPinAuthenticateUseCase>(
      () => _i50.ForgetPinAuthenticateUseCaseImpl(
            gh<_i45.ClientProvider>(),
            gh<_i29.AuthenticatorSelector>(),
            gh<_i29.BiometricUserVerifier>(),
            gh<_i29.FingerprintUserVerifier>(),
            gh<_i29.PinUserVerifier>(),
            gh<_i20.StateRepository<_i7.OperationType>>(),
            gh<_i27.ErrorHandler>(),
          ));
  gh.singleton<_i51.LocalDataBloc>(_i51.LocalDataBloc(
    gh<_i45.ClientProvider>(),
    gh<_i27.ErrorHandler>(),
  ));
  gh.factory<_i52.OobPayloadDecodeUseCase>(
      () => _i52.OobPayloadDecodeUseCaseImpl(
            gh<_i45.ClientProvider>(),
            gh<_i20.StateRepository<_i7.OperationType>>(),
          ));
  gh.factory<_i53.OobProcessUseCase>(() => _i53.OobProcessUseCaseImpl(
        gh<_i45.ClientProvider>(),
        gh<_i11.CreateDeviceInformationUseCase>(),
        gh<_i52.OobPayloadDecodeUseCase>(),
        gh<_i29.AccountSelector>(),
        gh<_i29.AuthenticatorSelector>(),
        gh<_i29.PinEnroller>(),
        gh<_i29.BiometricUserVerifier>(),
        gh<_i29.PinUserVerifier>(),
        gh<_i29.FingerprintUserVerifier>(),
        gh<_i26.DomainBloc>(),
        gh<_i20.StateRepository<_i5.UserInteractionOperationState>>(),
        gh<_i20.StateRepository<_i7.OperationType>>(),
      ));
  gh.factory<_i54.RegisteredAccountsUseCase>(
      () => _i54.RegisteredAccountsUseCaseImpl(gh<_i45.ClientProvider>()));
  gh.factory<_i55.RegistrationOpChangeSdkUseCase>(
      () => _i55.RegistrationOpChangeSdkUseCaseImpl(
            gh<_i11.CreateDeviceInformationUseCase>(),
            gh<_i29.AuthenticatorSelector>(),
            gh<_i29.PinEnroller>(),
            gh<_i29.BiometricUserVerifier>(),
            gh<_i29.FingerprintUserVerifier>(),
            gh<_i20.StateRepository<_i5.UserInteractionOperationState>>(),
            gh<_i20.StateRepository<_i7.OperationType>>(),
            gh<_i26.DomainBloc>(),
            gh<_i45.ClientProvider>(),
            gh<_i27.ErrorHandler>(),
          ));
  gh.factory<_i56.RegistrationUseCase>(() => _i56.RegistrationUseCaseImpl(
        gh<_i11.CreateDeviceInformationUseCase>(),
        gh<_i29.AuthenticatorSelector>(),
        gh<_i29.PinEnroller>(),
        gh<_i29.BiometricUserVerifier>(),
        gh<_i29.FingerprintUserVerifier>(),
        gh<_i20.StateRepository<_i5.UserInteractionOperationState>>(),
        gh<_i20.StateRepository<_i7.OperationType>>(),
        gh<_i45.ClientProvider>(),
        gh<_i27.ErrorHandler>(),
        gh<_i19.RouteGenerator>(),
      ));
  gh.factory<_i57.AuthenticateUseCase>(() => _i57.AuthenticateUseCaseImpl(
        gh<_i45.ClientProvider>(),
        gh<_i29.AuthenticatorSelector>(),
        gh<_i29.BiometricUserVerifier>(),
        gh<_i29.FingerprintUserVerifier>(),
        gh<_i29.PinUserVerifier>(),
        gh<_i20.StateRepository<_i7.OperationType>>(),
        gh<_i27.ErrorHandler>(),
        gh<_i20.StateRepository<_i5.UserInteractionOperationState>>(),
      ));
  gh.factory<_i58.AuthenticatorsUseCase>(
      () => _i58.AuthenticatorsUseCaseImpl(gh<_i45.ClientProvider>()));
  gh.factory<_i59.BiometricUseCase>(() => _i59.BiometricUseCaseImpl(
        gh<_i29.AuthenticatorSelector>(),
        gh<_i29.BiometricUserVerifier>(),
        gh<_i20.StateRepository<_i5.UserInteractionOperationState>>(),
        gh<_i20.StateRepository<_i7.OperationType>>(),
        gh<_i45.ClientProvider>(),
        gh<_i26.DomainBloc>(),
      ));
  gh.factory<_i60.ChangeDeviceInformationUseCase>(
      () => _i60.ChangeDeviceInformationUseCaseImpl(
            gh<_i45.ClientProvider>(),
            gh<_i20.StateRepository<_i7.OperationType>>(),
            gh<_i26.DomainBloc>(),
          ));
  gh.factory<_i61.ChangePinAuthenticateUsecase>(
      () => _i61.ChangePinAuthenticateUsecaseImpl(
            gh<_i45.ClientProvider>(),
            gh<_i29.AuthenticatorSelector>(),
            gh<_i29.PinUserVerifier>(),
            gh<_i20.StateRepository<_i7.OperationType>>(),
            gh<_i27.ErrorHandler>(),
          ));
  gh.factory<_i62.ChangePinUseCase>(() => _i62.ChangePinUseCaseImpl(
        gh<_i45.ClientProvider>(),
        gh<_i29.PinChanger>(),
        gh<_i26.DomainBloc>(),
        gh<_i20.StateRepository<_i7.OperationType>>(),
        gh<_i20.StateRepository<_i8.PinChangeState>>(),
        gh<_i27.ErrorHandler>(),
      ));
  gh.singleton<_i63.AppBloc>(_i63.AppBloc(
    gh<_i28.FingerPrintListenForOsCredentialsUseCase>(),
    gh<_i23.BiometricListenForOsCredentialsUseCase>(),
    gh<_i58.AuthenticatorsUseCase>(),
    gh<_i10.ConfigurationLoader>(),
    gh<_i25.CancelUserInteractionOperationUseCase>(),
    gh<_i27.ErrorHandler>(),
    gh<_i26.DomainBloc>(),
    gh<_i19.RouteGenerator>(),
  ));
  return getIt;
}
