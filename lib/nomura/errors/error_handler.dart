// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/data/params/result_parameter.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/domain/operation/user_interaction_operation_state.dart';
import 'package:nomura_mobile/nomura/errors/error_exception.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';
import 'package:nomura_mobile/nomura/utils/constant_utils.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/state_repository.dart';

abstract class ErrorHandler {
  // Flutter might send back Error as well as Exception
  void handle(
      {required dynamic exception, OperationType? operationType, String? aaid});
}

@Injectable(as: ErrorHandler)
class ErrorHandlerImpl extends ErrorHandler {
  // Here we cannot use AppBlock for navigation because AppBlock also injects an instance of ErrorHandler, that would lead to circular dependency.
  final RouteGenerator _globalNavigationManager;
  final StateRepository<UserInteractionOperationState>
      _userInteractionOperationStateRepository;

  ErrorHandlerImpl(
    this._globalNavigationManager,
    this._userInteractionOperationStateRepository,
  );

  @override
  void handle(
      {required dynamic exception,
      OperationType? operationType,
      String? aaid}) {
    print('exception on handle----->$exception');

    if (exception is MobileAuthenticationClientError) {
      print('case handler one===');
      _navigateToResultWith(
          parameter: _processMobileAuthenticationClientError(exception),
          aaid: aaid,
          operationType: operationType);
    } else if (exception is PlatformSdkException) {
      print('case handler two===');

      _navigateToResultWith(
          parameter: _processPlatformSdkException(exception),
          aaid: aaid,
          operationType: operationType);
    } else if (exception is BusinessException) {
      print('case handler three===');

      _navigateToResultWith(
          parameter: ResultParameter.failure(errorType: exception.type),
          aaid: aaid,
          operationType: operationType);
    } else if (exception is ResultParameter) {
      print('case handler four===');

      _navigateToResultWith(
          parameter: exception, aaid: aaid, operationType: operationType);
    } else {
      print('case handler five===');

      _navigateToResultWith(
          parameter: ResultParameter.failure(
              description: exception.toString(), operationType: operationType),
          aaid: aaid);
    }
  }

  void _navigateToResultWith(
      {required ResultParameter parameter,
      String? aaid,
      OperationType? operationType}) {
    SaveLocal().setException(parameter.description.toString());
    final context = _globalNavigationManager.navigatorContext;
    _userInteractionOperationStateRepository.reset();

    if (context != null) {
      if (parameter.fidoErrorCodeType == FidoErrorCodeType.userNotEnrolled) {
        errorDialog(
          context,
          content: 'Go to Settings and enroll biometric registration',
          onPressed: () {
            _globalNavigationManager.pop();
          },
        );
      } else if (aaid == (isIOS ? "F1D0#1003" : "F1D0#0003")) {
        SaveLocal().saveSelector(isIOS ? "F1D0#1001" : "F1D0#0001");
        okDialog(context,
            content: "Failed to register biometric",
            onPressed: () => _globalNavigationManager.pushSuccessFulScreen(),
            isSuccess: false,
            btnText: 'Skip');
      } else if (operationType == OperationType.pinChange) {
        debugPrint("USER CANCELED ===>>>  ${parameter.fidoErrorCodeType}");
        if (parameter.fidoErrorCodeType == FidoErrorCodeType.userCanceled) {
          debugPrint("USER CANCELED ===>>> ");
        } else if (parameter.description == 'Change Login PIN Cancelled!') {
          Navigator.of(context).popUntil((route) => route.isFirst);
          Navigator.pushNamed(
            context,
            Routes.changeLoginPin,
          );
        } else if (parameter.description == "Invalid PIN provided" ||
            parameter.description == "Invalid PIN.") {
          okDialog(context, content: 'Change login PIN authentication failed!',
              onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.pushNamed(
              context,
              Routes.changeLoginPin,
            );
          }, isSuccess: false);
        } else if (parameter.description != "Invalid PIN provided" ||
            parameter.description != "Invalid PIN.") {
          okDialog(context, content: '${parameter.description}', onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.pushNamed(
              context,
              Routes.changeLoginPin,
            );
          }, isSuccess: false);
        }
      } else if (operationType == OperationType.authentication) {
        debugPrint("USER CANCELED AUTH ===>>>  ${parameter.fidoErrorCodeType}");
        if (parameter.fidoErrorCodeType == FidoErrorCodeType.userCanceled) {
          debugPrint("USER CANCELED AUTH ===>>> ");
        } else if (parameter.description == "Invalid PIN provided" ||
            parameter.description == "Invalid PIN.") {
          okDialog(context, content: "Authentication failed!", onPressed: () {
            _globalNavigationManager.pushLoginScreen();
          }, isSuccess: false);
        } else if (parameter.fidoErrorCodeType ==
            FidoErrorCodeType.userLockout) {
          okDialog(context, content: "Too many attempts!", onPressed: () {
            _globalNavigationManager.pushLoginScreen();
          }, isSuccess: false);
        } else {
          okDialog(context, content: "${parameter.description}", onPressed: () {
            // _globalNavigationManager.pop();
            // _globalNavigationManager.pop();
            _globalNavigationManager.pushLoginScreen();
          }, isSuccess: false);
        }
      } else if (operationType == OperationType.deregistration) {
        if (parameter.description == "Invalid PIN provided" ||
            parameter.description == "Invalid PIN.") {
          okDialog(context, content: "Authentication failed!", onPressed: () {
            _globalNavigationManager.pop();
            _globalNavigationManager.pop();
            _globalNavigationManager.pop();
          }, isSuccess: false);
        } else {
          okDialog(context, content: "Authentication failed!", onPressed: () {
            _globalNavigationManager.pop();
            _globalNavigationManager.pop();
            _globalNavigationManager.pop();
          }, isSuccess: false);
        }
      } else if (operationType == OperationType.registration) {
        if ((parameter.fidoErrorCodeType != null &&
                aaid == 'changeBiometric') &&
            (parameter.fidoErrorCodeType == FidoErrorCodeType.userCanceled ||
                parameter.fidoErrorCodeType ==
                    FidoErrorCodeType.userNotEnrolled ||
                parameter.fidoErrorCodeType ==
                    FidoErrorCodeType.userNotResponsive)) {
          okDialog(
            context,
            content: 'Biometric setting update failed!',
            onPressed: () {
              _globalNavigationManager.pop();
              _globalNavigationManager.pop();
              _globalNavigationManager.pop();
            },
            isSuccess: false,
          );
        } else if (parameter.fidoErrorCodeType ==
                FidoErrorCodeType.userNotEnrolled &&
            aaid != 'changeBiometric') {
          errorDialog(
            context,
            content: 'Go to Settings and enroll biometric registration',
            onPressed: () {
              _globalNavigationManager.pop();
              // _globalNavigationManager.pushSuccessFulScreen();
            },
          );
        } else {
          okDialog(context, content: 'Registration failed!', onPressed: () {
            _globalNavigationManager.pushRegistrationScreen();
          }, isSuccess: false);
        }
      } else {}
    } else {
      debugPrint('Failed to navigate to result screen.');
    }
  }

  ResultParameter _processPlatformSdkException(PlatformSdkException exception) {
    MobileAuthenticationClientError error = exception.error;
    String errorDescription = error.description;
    if (exception is InitializationError) {
      return ResultParameter.failure(description: errorDescription);
    }
    if (error is OperationFidoError) {
      errorDescription = error.errorCode.description;
    }
    return ResultParameter.failure(description: errorDescription);
  }

  ResultParameter _processMobileAuthenticationClientError(
    MobileAuthenticationClientError error,
  ) {
    print('error in mobile client error==>${error.description}');

    if (error is InitializationError) {
      print('initialization error ===>${error.description}');
      return ResultParameter.failure(description: error.description);
    } else if (error is OperationFidoError) {
      print(
          'operation fido error error description==>${error.errorCode.description}');
      print('operation fido error error type==>${error.errorCode.type}');

      return ResultParameter.failure(
          description: error.errorCode.description,
          fidoErrorCodeType: error.errorCode.type);
    }
    return ResultParameter.failure(description: error.description);
  }
}
// showDialog(
        //   barrierDismissible: false,
        //   context: context,
        //   builder: (context) => AlertDialog(
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(AppSize.s12)),
        //     titlePadding: const EdgeInsets.all(0),
        //     title: Container(
        //         height: 9,
        //         decoration: BoxDecoration(
        //             color: ColorUtils.ligthRed,
        //             borderRadius: const BorderRadius.only(
        //                 topLeft: Radius.circular(AppSize.s12),
        //                 topRight: Radius.circular(AppSize.s12)))),
        //     actionsPadding: const EdgeInsets.all(0),
        //     content: Container(
        //       margin: const EdgeInsets.symmetric(vertical: AppMargin.m18),
        //       child: Column(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           Image.asset(
        //             'assets/warning.png',
        //             width: 60,
        //             height: 60,
        //           ),
        //           Container(
        //             margin: const EdgeInsets.symmetric(vertical: AppMargin.m20),
        //             child: Text(
        //               "Failed to register Biometric",
        //               style: getApplicationTheme()
        //                   .textTheme
        //                   .bodySmall!
        //                   .copyWith(color: Colors.black),
        //               textAlign: TextAlign.center,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     actions: [
        //       Container(
        //         width: MediaQuery.of(context).size.width,
        //         height: 43,
        //         decoration: BoxDecoration(
        //             color: ColorUtils.primary,
        //             borderRadius: const BorderRadius.only(
        //                 bottomLeft: Radius.circular(AppSize.s12),
        //                 bottomRight: Radius.circular(AppSize.s12))),
        //         child: TextButton(
        //           onPressed: () =>
        //               _globalNavigationManager.pushSuccessFulScreen(),
        //           child: Text(
        //             'Skip',
        //             style: getApplicationTheme()
        //                 .textTheme
        //                 .bodySmall!
        //                 .copyWith(color: Colors.white),
        //             textAlign: TextAlign.center,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // );