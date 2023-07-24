
// import 'dart:async';
// import 'package:flutter/foundation.dart';
// import 'package:injectable/injectable.dart';
// import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';


// abstract class RegistrationUseCase {
//   Future<void> execute({
//     required String username,
//     required AuthorizationProvider? authorizationProvider,
//   });
// }

// @Injectable(as: RegistrationUseCase)
// class RegistrationUseCaseImpl implements RegistrationUseCase {
//   final ClientProvider _clientProvider;
//   final CreateDeviceInformationUseCase _createDeviceInformationUseCase;
//   final AuthenticatorSelector _authenticatorSelector;
//   final PinEnroller _pinEnroller;
//   final BiometricUserVerifier _biometricUserVerifier;
//   final FingerprintUserVerifier _fingerprintUserVerifier;
//   final DomainBloc _domainBloc;
//   final StateRepository<UserInteractionOperationState>
//       _userInteractionOperationStateRepository;
//   final StateRepository<OperationType> _operationTypeRepository;
//   final ErrorHandler _errorHandler;

//   RegistrationUseCaseImpl(
//     this._clientProvider,
//     this._createDeviceInformationUseCase,
//     this._authenticatorSelector,
//     this._pinEnroller,
//     this._biometricUserVerifier,
//     this._fingerprintUserVerifier,
//     this._domainBloc,
//     this._userInteractionOperationStateRepository,
//     this._operationTypeRepository,
//     this._errorHandler,
//   );

//   @override
//   Future<void> execute({
//     required String username,
//     required AuthorizationProvider? authorizationProvider,
//   }) async {
//     final deviceInformation = await _createDeviceInformationUseCase.execute();
//     _operationTypeRepository.save(OperationType.registration);
//     var registration = _clientProvider.client.operations.registration
//         .username(username)
//         .deviceInformation(deviceInformation)
//         .authenticatorSelector(_authenticatorSelector)
//         .pinEnroller(_pinEnroller)
//         .biometricUserVerifier(_biometricUserVerifier)
//         .fingerprintUserVerifier(_fingerprintUserVerifier)
//         .onSuccess(() {
//       debugPrint('In-band registration succeeded.');
//       _domainBloc.add(ResultEvent());
//       _userInteractionOperationStateRepository.reset();
//     }).onError((error) {
//       debugPrint('In-band registration failed: ${error.runtimeType}');
//       _errorHandler.handle(error);
//       _userInteractionOperationStateRepository.reset();
//     });

//     if (authorizationProvider != null) {
//       registration.authorizationProvider(authorizationProvider);
//     }

//     return await registration.execute();
//   }
// }
