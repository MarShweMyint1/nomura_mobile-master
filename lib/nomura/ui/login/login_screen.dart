import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/params/token_param.dart';
import 'package:nomura_mobile/nomura/data/params/validate_user.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/riverpod/authentication/authentication_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/authentication/authentication_state.dart'
    as authentication;
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/device_check_primality/device_check_primality_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/device_check_primality/device_check_primality_state.dart'
    as check;
import 'package:nomura_mobile/nomura/riverpod/pwd_authz/pwd_authz_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/token/token_provider.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/login/login_operation.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_button.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/riverpod/token/token_state.dart' as tok;
import 'package:nomura_mobile/nomura/riverpod/pwd_authz/pwd_authz_state.dart'
    as authz;
import 'package:nomura_mobile/nomura/utils.dart';
import 'package:nomura_mobile/nomura/utils/collection_utils.dart';
import 'package:nomura_mobile/nomura/utils/constant_utils.dart';
import 'package:nomura_mobile/nomura/utils/enumeration.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _UserNameLoginScreenState();
}

class _UserNameLoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController usernameCnt = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // var skipBiometric = ref.watch(isSkipBiometricProvider);

    ref.listen<authentication.AuthenticationState>(
        authenticationNotifierProvider, (previous, next) async {
      SaveLocal().saveRouteName(Routes.initRoute);
      if (next is authentication.Loading) {
        if (await fingerprintEnrollment()) {
        } else {
          loadingDialog(context);
        }
      } else if (next is Error) {
        Navigator.pop(context);
      }
    });

    ref.listen<authz.PwdAuthzState>(authzNotifierProvider, (pre, next) async {
      if (next is authz.Loading) {
        loadingDialog(context);
      }
      if (next is authz.Data) {
        Navigator.pop(context);
        debugPrint(
            "AUTHZ DATA ===>>> ${next.data.code} || ${next.data.verifier}");
        if (next.data.code != "") {
          TokenParam params = TokenParam(
            code: next.data.code.toString(),
            codeVerifier: next.data.verifier.toString(),
          );
          ref.read(tokenNotifierProvider.notifier).tokenFunc(params);
        }
      } else if (next is Error) {
        Navigator.pop(context);
      }
    });

    ref.listen<tok.TokenState>(tokenNotifierProvider, (pre, next) async {
      if (next is tok.Loading) {
        loadingDialog(context);
      }
      if (next is tok.Data) {
        Navigator.pop(context);

        debugPrint(
            "AUTH TOKEN DATA ===>>> ${next.data.access_token} || ${next.data.id_token}");
        if (next.data.access_token != null && next.data.id_token != null) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.loginSuccessRoute,
            (_) => false,
            arguments: next.data.access_token,
          );
        }
      } else if (next is Error) {
        Navigator.pop(context);
      }
    });

    ref.listen<check.DeviceCheckPrimalityState>(
        deviceCheckPrimalityNotifierProvider, (previous, next) async {
      if (next is check.Loading) {
        loadingDialog(context);
      } else if (next is check.Data) {
        Navigator.pop(context);
        List dispatchTargetsList = next.data.dispatchTargets!.toList();
        ref
            .read(dispatchTargetProvider.notifier)
            .saveDispatchTarget(dispatchTargetsList);

        loginOperation(
          dispatchTargetsList,
          AuthType.login,
          ref,
          context,
        );
      } else if (next is Error) {
        Navigator.pop(context);
      } else if (next is check.NoPrimaryDevice) {
        Navigator.pop(context);
        if (next.data.code == "USER_NOT_FOUND") {
          okDialog(context,
              content: StringUtils.usernameValidation,
              onPressed: () => Navigator.pop(context),
              isSuccess: false);
        } else {
          okDialog(
            context,
            content:
                next.data.message ?? 'No primary device is found for the user',
            onPressed: () => Navigator.pushNamed(context, Routes.usernameRoute),
            isSuccess: false,
          );
        }
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorUtils.primary,
      appBar: nomuraTextAppbar(),
      body: Form(
        key: formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: AppMargin.m32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              titleText('Login with\nyour device'),
              const Spacer(),
              TextFormField(
                controller: usernameCnt,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: StringUtils.enterUsername,
                  hintStyle: getApplicationTheme()
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 12),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorStyle: getApplicationTheme()
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.yellow),
                ),
              ),
              const Spacer(),
              const Spacer(),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Container(
          padding: const EdgeInsets.all(AppPadding.p32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                  btnText: 'Login',
                  onTap: () async {
                    if (usernameCnt.text.trim().toString().isEmpty) {
                      okDialog(
                        context,
                        content: StringUtils.userEmpty,
                        onPressed: () => Navigator.pop(context),
                        isSuccess: false,
                      );
                    } else {
                      if (regExpStringType(
                          usernameCnt.text.trim().toString())) {
                        bool isBiometricEnabled =
                            await SaveLocal().getisBiometricEnabled() ?? false;
                        bool isBiometricEnrolled =
                            await SaveLocal().getIsBiometricEnrolled() ?? false;

                        await SaveLocal()
                            .getSupportedDevice()
                            .then((hasBiometric) async {
                          print('biometric enroll===>$isBiometricEnrolled');
                          print('biometric enable===>$isBiometricEnabled');
                          if (hasBiometric &&
                              isBiometricEnrolled &&
                              isBiometricEnabled) {
                            SaveLocal().saveSelector(
                                isIOS ? "F1D0#1003" : "F1D0#0003");
                          } else if (await fingerprintEnrollment() &&
                              isBiometricEnrolled &&
                              isBiometricEnabled) {
                            SaveLocal().saveSelector(
                                isIOS ? "F1D0#1002" : "F1D0#0002");
                          } else {
                            SaveLocal().saveSelector(
                                isIOS ? "F1D0#1001" : "F1D0#0001");
                          }
                        });

                        ref
                            .read(deviceCheckPrimalityNotifierProvider.notifier)
                            .deviceCheckPrimalityFunc(
                              ValidateUserParams(
                                userName: usernameCnt.text.trim(),
                              ),
                            );

                        // });
                      } else {
                        okDialog(
                          context,
                          content: StringUtils.usernameValidation,
                          onPressed: () => Navigator.pop(context),
                          isSuccess: false,
                        );
                      }
                    }
                  }),
              const SizedBox(height: AppSize.s32),
              overAllText(
                'Don\'t have an account?',
                textAlign: TextAlign.center,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.usernameRoute,
                  (Route<dynamic> route) => false,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppSize.s12),
                  child: Text(
                    'Register Now',
                    style: getApplicationTheme().textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          fontSize: 12,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
