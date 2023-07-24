import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:nomura_mobile/nomura/data/params/select_authenticator_parameter.dart';
import 'package:nomura_mobile/nomura/ui/WebView/web_view_error_screen.dart';
import 'package:nomura_mobile/nomura/ui/WebView/web_view_screen.dart';
import 'package:nomura_mobile/nomura/ui/biometric_settings/biometric_change_confirm_screen.dart';
import 'package:nomura_mobile/nomura/ui/biometric_settings/biometric_enable.dart';
import 'package:nomura_mobile/nomura/ui/biometric_settings/biometric_change_successful.dart';
import 'package:nomura_mobile/nomura/ui/change_pin/change_pin_successful.dart';
import 'package:nomura_mobile/nomura/ui/change_pin/change_pin_confirmed.dart';
import 'package:nomura_mobile/nomura/ui/change_pin/change_pin.dart';
import 'package:nomura_mobile/nomura/ui/deregister/biometric_deregisteration.dart';
import 'package:nomura_mobile/nomura/ui/deregister/deregisteration_success.dart';
import 'package:nomura_mobile/nomura/ui/deregister/deregistration_pin.dart';
import 'package:nomura_mobile/nomura/ui/deregister/deregistration_success.dart';
import 'package:nomura_mobile/nomura/ui/deregister/pin_deregisteration.dart';
import 'package:nomura_mobile/nomura/ui/forgot/pin_entry/confirm_reset_pin.dart';
import 'package:nomura_mobile/nomura/ui/forgot/pin_entry/reset_pin_screen.dart';
import 'package:nomura_mobile/nomura/ui/forgot/reset_pin_verify_code/reset_pin_verify_code_vm.dart';
import 'package:nomura_mobile/nomura/ui/forgot/reset_pin_verify_mail/reset_pin_verify_link_vm.dart';
import 'package:nomura_mobile/nomura/ui/forgot/forgot_pin_successful.dart';
import 'package:nomura_mobile/nomura/ui/login/login_screen.dart';
import 'package:nomura_mobile/nomura/ui/change_pin/change_login_pin.dart';
import 'package:nomura_mobile/nomura/ui/login/login_success.dart';
import 'package:nomura_mobile/nomura/ui/login/pin_login.dart';
import 'package:nomura_mobile/nomura/ui/login/verify_login.dart';
import 'package:nomura_mobile/nomura/ui/register/biometric/biometric_setup_screen.dart';
import 'package:nomura_mobile/nomura/ui/register/device_detected/device_detected_vm.dart';
import 'package:nomura_mobile/nomura/ui/register/fingerprint/fingerprint_screen.dart';
import 'package:nomura_mobile/nomura/ui/register/pin_entry/confirmed_pin_screen.dart';
import 'package:nomura_mobile/nomura/ui/register/pin_entry/setup_pin_screen.dart';
import 'package:nomura_mobile/nomura/ui/register/setup_faceid.dart';
import 'package:nomura_mobile/nomura/ui/register/successfully_registered_screen.dart';
import 'package:nomura_mobile/nomura/ui/register/username/username_vm.dart';
import 'package:nomura_mobile/nomura/ui/register/verify_code/verify_code_vm.dart';
import 'package:nomura_mobile/nomura/ui/register/verify_mail/verify_mail_vm.dart';
import 'package:nomura_mobile/nomura/ui/secondary/approve_login_screen.dart';
import 'package:nomura_mobile/nomura/ui/secondary/qr_login_screen.dart';
import 'package:nomura_mobile/nomura/ui/splash/splash_screen.dart';
import 'package:nomura_mobile/nomura/ui/webview/account_setting_screen.dart';
import 'package:nomura_mobile/nomura/utils/string_utils.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';

class Routes {
  static const String splashRoute = '/';
  static const String initRoute = '/initLogin';
  static const String usernameRoute = '/username';
  static const String detectRoute = '/detect';
  static const String verifyLinkRoute = '/verifyLink';
  static const String qrLoginRoute = '/qrLogin';
  static const String approveLoginRoute = '/approveLogin';
  static const String forgotRoute = '/forgotPin';
  static const String verifyCodeRoute = '/verifyCode';
  static const String setupPinRoute = '/setupPin';
  static const String confirmPinRoute = '/confirmPin';
  static const String setupBiometricRoute = '/setupBiometric';
  static const String setupFaceIDRoute = '/setupFaceID';
  static const String successfulRegisterRoute = '/successfulRegister';
  static const String successfulDeregistrationRoute =
      '/successfulDeregistration';
  static const String homeRoute = '/home';
  static const String settingRoute = '/settings';
  static const String changeLoginPin = '/changeLoginPin';
  static const String changePinRoute = '/changePin';
  static const String changePinConfirmedRoute = '/changePinConfirmed';
  static const String changePinSuccessfulRoute = '/changePinSuccessful';
  static const String pinDeregisterRoute = '/pinDeregister';
  static const String biometricDeregisterRoute = '/biometricDeregister';
  static const String deregisterationSuccessRoute = '/deregisterSuccess';
  static const String biometricSettingsRoute = '/biometricSettings';
  static const String biometricChangeSuccessfulRoute =
      '/biometricChangeSuccessfulRoute';
  static const String loginPinRoute = '/loginPin';
  static const String loginSuccessRoute = '/loginSuccess';
  static const String resultRoute = '/resultRoute';
  static const String webviewErrorRoute = '/webviewError';
  static const String authenticateselectorRoute = '/authenticateSelector';
  static const String pinRoute = '/pinRoute';
  static const String resetPinRoute = '/resetPinRoute';
  static const String confirmResetPinRoute = '/confirmResetPinRoute';
  static const String confirmBiometricChangeRoute =
      '/confirmBiometricChangeRoute';
  static const String fingerprintRoute = '/fingerprintRoute';
  static const String verifyLoginRoute = '/verifyLogin';
  static const String pinDeregRoute = '/pinDereg';
  static const String resetPinVerifyMailRoute = '/resetPinVerifyMail';
  static const String resetPinVerifyCodeRoute = '/resetPinVerifyCode';
  static const String forgotPinSuccessRoute = '/forgotPinSuccess';
}

@singleton
class RouteGenerator {
  GlobalKey<NavigatorState>? _navigatorKey;

  void setNavigatorKey(GlobalKey<NavigatorState> key) {
    _navigatorKey = key;
  }

  BuildContext? get navigatorContext => _navigatorKey?.currentContext;
  NavigatorState? get navigatorState => _navigatorKey?.currentState;

  Future<dynamic>? pushAuthenticatorSelector(
      SelectAuthenticatorParameter parameter) {
    return _navigatorKey?.currentState
        ?.pushNamed(Routes.authenticateselectorRoute, arguments: parameter);
  }

  Future<dynamic>? pushPinLoginScreen() {
    return _navigatorKey?.currentState?.pushNamed(Routes.loginPinRoute);
  }

  Future<dynamic>? pushPinDeregScreen() {
    return _navigatorKey?.currentState?.pushNamed(Routes.pinDeregRoute);
  }

  Future<dynamic>? pushBiometricChangeSuccessfulScreen(String biometricState) {
    return _navigatorKey?.currentState?.pushNamed(
        Routes.biometricChangeSuccessfulRoute,
        arguments: biometricState);
  }

  Future<dynamic>? pushChangePinScreen() {
    return _navigatorKey?.currentState?.pushNamed(Routes.changePinRoute);
  }

  Future<dynamic>? pushChangePinConfirmScreen(List args) {
    return _navigatorKey?.currentState
        ?.pushNamed(Routes.changePinConfirmedRoute, arguments: args);
  }

  Future<dynamic>? pushPinScreen() {
    return _navigatorKey?.currentState?.pushNamed(
      Routes.setupPinRoute,
    );
  }

  Future<dynamic>? pushRegistrationScreen() {
    return _navigatorKey?.currentState?.pushNamed(
      Routes.usernameRoute,
    );
  }

  Future<dynamic>? pushLoginScreen() {
    return _navigatorKey?.currentState?.pushNamedAndRemoveUntil(
      Routes.initRoute,
      (Route<dynamic> route) => false,
    );
  }

  Future<dynamic>? pushSuccessFulScreen() {
    return _navigatorKey?.currentState?.pushNamedAndRemoveUntil(
      Routes.successfulRegisterRoute,
      (Route<dynamic> route) => false,
    );
  }

  Future<dynamic>? pushSuccessFulDeregistrationScreen() {
    return _navigatorKey?.currentState?.pushNamedAndRemoveUntil(
      Routes.successfulDeregistrationRoute,
      (Route<dynamic> route) => false,
    );
  }

  Future<dynamic>? pinChangeSuccessFulScreen(bool isForgetPin) {
    return _navigatorKey?.currentState?.pushNamed(
      Routes.changePinSuccessfulRoute,
      arguments: isForgetPin,
    );
  }

  Future<dynamic>? pushResetPinScreen() {
    return _navigatorKey?.currentState?.pushReplacementNamed(
      Routes.resetPinRoute,
    );
  }

  pop() {
    return _navigatorKey?.currentState?.pop();
  }

  Future<dynamic>? pushBiometricScreen(SelectAuthenticatorParameter parameter) {
    return _navigatorKey?.currentState?.pushNamed(
      Routes.setupBiometricRoute,
      arguments: parameter,
    );
  }

  Future<dynamic>? pushFingerPrintScreen(
      SelectAuthenticatorParameter parameter) {
    return _navigatorKey?.currentState?.pushNamed(
      Routes.fingerprintRoute,
      arguments: parameter,
    );
  }

  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    SaveLocal().saveRouteName(routeSettings.name.toString());
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.initRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case Routes.usernameRoute:
        return MaterialPageRoute(
          builder: (_) => const UserNameVMScreen(),
        );
      case Routes.detectRoute:
        return MaterialPageRoute(
          builder: (_) => const DeviceDetectedVM(),
        );
      case Routes.verifyLoginRoute:
        return MaterialPageRoute(
          builder: (_) => const VerifyLogin(),
        );
      case Routes.verifyLinkRoute:
        return MaterialPageRoute(
          builder: (_) => const VerifyMailVM(),
        );
      case Routes.qrLoginRoute:
        return MaterialPageRoute(
          builder: (_) => const QRLoginScreen(),
        );
      case Routes.approveLoginRoute:
        return MaterialPageRoute(
          builder: (_) => const ApproveLoginScreen(),
        );
      case Routes.forgotPinSuccessRoute:
        return MaterialPageRoute(
          builder: (_) => const SuccessFullyForgotPinScreen(),
        );
      case Routes.verifyCodeRoute:
        return MaterialPageRoute(
          builder: (_) => const VerifyCodeVM(),
        );
      case Routes.setupPinRoute:
        return MaterialPageRoute(
          builder: (_) => const SetupPINScreen(),
        );
      case Routes.confirmPinRoute:
        final args = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ConfirmedPinScreen(pinNumber: args),
        );
      case Routes.setupBiometricRoute:
        final args = routeSettings.arguments as SelectAuthenticatorParameter;
        return MaterialPageRoute(
          builder: (_) => BiometricSetupScreen(parameter: args),
        );
      case Routes.fingerprintRoute:
        final args = routeSettings.arguments as SelectAuthenticatorParameter;
        return MaterialPageRoute(
          builder: (_) => FingerPrintScreen(parameter: args),
        );
      case Routes.setupFaceIDRoute:
        return MaterialPageRoute(
          builder: (_) => const SetupFaceIDScreen(),
        );
      case Routes.successfulRegisterRoute:
        return MaterialPageRoute(
          builder: (_) => const SuccessFullyRegisteredScreen(),
        );
      case Routes.successfulDeregistrationRoute:
        return MaterialPageRoute(
          builder: (_) => const SuccessFullyDegistrationScreen(),
        );
      case Routes.homeRoute:
        final args = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => WebViewPage(token: args),
        );
      case Routes.settingRoute:
        return MaterialPageRoute(
          builder: (_) => const AccountSettingScreen(),
        );
      case Routes.changeLoginPin:
        return MaterialPageRoute(
          builder: (_) => const ChangeLoginPinScreen(),
        );
      case Routes.changePinRoute:
        return MaterialPageRoute(
          builder: (_) => const ChangePinScreen(),
        );
      case Routes.changePinConfirmedRoute:
        final args = routeSettings.arguments as List;
        return MaterialPageRoute(
          builder: (_) => ChangePinConfirmScreen(pin: args),
        );
      case Routes.changePinSuccessfulRoute:
        final args = routeSettings.arguments as bool;
        return MaterialPageRoute(
          builder: (_) => ChangePinSuccessfulScreen(isForgetPin: args),
        );
      case Routes.pinDeregisterRoute:
        return MaterialPageRoute(
          builder: (_) => const PinDeregisterationScreen(),
        );
      case Routes.biometricDeregisterRoute:
        return MaterialPageRoute(
          builder: (_) => const BiometricDeregisterationScreen(),
        );
      case Routes.deregisterationSuccessRoute:
        return MaterialPageRoute(
          builder: (_) => const DeregisterationSuccess(),
        );
      case Routes.biometricSettingsRoute:
        final args = routeSettings.arguments as bool;

        return MaterialPageRoute(
          builder: (_) => BiometricSettingsScreen(isBiometric: args),
        );
      case Routes.biometricChangeSuccessfulRoute:
        final args = routeSettings.arguments as String;

        return MaterialPageRoute(
          builder: (_) => BiometricChangeSuccessfulScreen(biometricState: args),
        );
      case Routes.pinDeregRoute:
        return MaterialPageRoute(
          builder: (_) => const DeregistrationPinScreen(),
        );

      case Routes.loginPinRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginPinScreen(),
        );
      case Routes.loginSuccessRoute:
        final args = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => LoginSuccess(
            token: args,
          ),
        );
      //   return MaterialPageRoute(
      //     builder: (_) => const WebViewScreen(),
      //   );
      case Routes.resultRoute:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(),
        );
      case Routes.webviewErrorRoute:
        final args = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => WebViewErrorScreen(
            errorLogId: args,
          ),
        );
      case Routes.resetPinRoute:
        return MaterialPageRoute(builder: (_) => const ResetPinScreen());
      case Routes.confirmResetPinRoute:
        final args = routeSettings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => ConfirmResetPin(pinNumber: args));
      case Routes.confirmBiometricChangeRoute:
        final args = routeSettings.arguments as bool;
        return MaterialPageRoute(
          builder: (context) => BiometricChangeConfirmScreen(toggleValue: args),
        );
      case Routes.resetPinVerifyMailRoute:
        return MaterialPageRoute(
          builder: (context) => const ResetPinVerifyMailVm(),
        );
      case Routes.resetPinVerifyCodeRoute:
        return MaterialPageRoute(
          builder: (context) => const ResetPinVerifyCodeVM(),
        );
      // case Routes.authenticateselectorRoute:
      //   final args = routeSettings.arguments as SelectAuthenticatorParameter;
      //   return MaterialPageRoute(
      //     builder: (_) => SelectAuthenticatorScreen(
      //       selectAuthenticatorParameter: args,
      //     ),
      //   );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(StringUtils.routeNotFound),
        ),
        body: const Center(
          child: Text(StringUtils.routeNotFound),
        ),
      ),
    );
  }
}
