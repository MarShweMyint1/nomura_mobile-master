// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/params/resend_sms.dart';
import 'package:nomura_mobile/nomura/data/params/validate_user.dart';
import 'package:nomura_mobile/nomura/domain/operation/login_init_client.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/legacy_login/legacy_login_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/legacy_login/legacy_login_state.dart';
import 'package:nomura_mobile/nomura/riverpod/pin_verify/pin_verify_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/pin_verify/pin_verify_state.dart'
    as verify;

import 'package:nomura_mobile/nomura/riverpod/resend_mail/resend_mail_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/resend_mail/resend_mail_state.dart'
    as resend_mail;
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_button.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_pin.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils/collection_utils.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/constant_utils.dart';
import 'package:nomura_mobile/nomura/utils/device_detail.dart';
import 'package:nomura_mobile/nomura/utils/enumeration.dart';
import 'package:nomura_mobile/nomura/utils/string_utils.dart';
import 'package:nomura_mobile/nomura/utils/theme_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

class DeregistrationPinScreen extends ConsumerStatefulWidget {
  const DeregistrationPinScreen({super.key});
  @override
  ConsumerState<DeregistrationPinScreen> createState() =>
      _DeregistrationPinScreen();
}

class _DeregistrationPinScreen extends ConsumerState<DeregistrationPinScreen> {
  TextEditingController pinController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    ref.listen<verify.PinVerifyState>(pinVerifyNotifierProvider, (pre, next) {
      if (next is verify.Loading) {
        loadingDialog(context);
      }
      if (next is verify.Data) {
        Navigator.pop(context);
      } else if (next is Error) {
        Navigator.pop(context);
      }
    });

    ref.listen<resend_mail.ResendMailState>(
      resendMailNotifierProvider,
      (previous, next) {
        if (next is resend_mail.Loading) {
          loadingDialog(context);
        }

        if (next is resend_mail.Data) {
          Navigator.pop(context);
          if (next.data.code == "EMAIL_VERIFIED") {
            SaveLocal().saveIsForgetPin(true);

            Navigator.pushReplacementNamed(context, Routes.verifyLinkRoute,
                arguments: true);
          } else if (next.data.code == "USER_NOT_FOUND") {
            okDialog(context,
                content: next.data.message.toString(),
                onPressed: () => Navigator.pop(context),
                isSuccess: false);
          } else {
            okDialog(context,
                content: next.data.message.toString(),
                onPressed: () => Navigator.pop(context),
                isSuccess: false);
          }
        } else if (next is resend_mail.Error) {
          Navigator.pop(context);
          okDialog(context,
              content: "Something was wrong",
              onPressed: () => Navigator.pop(context),
              isSuccess: false);
        }
      },
    );

    ref.listen<LegacyState>(legacyLoginNotifierProvider, (pre, next) {
      if (next is Loading) {
        loadingDialog(context);
      }
      if (next is Data) {
        Navigator.pop(context);
        if (next.data.code == "USER_DECIDE_REMOVE_DEVICE") {
          SaveLocal().saveDeregister(true);
          final username = ref.read(usernameProvider);
          ref.read(resendMailNotifierProvider.notifier).resendMailFunc(
                ResendSMSParams(
                  userName: username,
                  generate: true,
                ),
              );
        }
        if (next.data.code == "USER_NOT_FOUND") {
          okDialog(context,
              content: next.data.message.toString(),
              onPressed: () => Navigator.pop(context),
              isSuccess: false);
        } else if (next.data.code == "EMAIL_FAILED_TO_SENT") {
          okDialog(context,
              content: next.data.message.toString(),
              onPressed: () => Navigator.pop(context),
              isSuccess: false);
        }
      } else if (next is Lock) {
        Navigator.pop(context);
        okDialog(context,
            content: next.data.message.toString(),
            onPressed: () => Navigator.pop(context),
            isSuccess: false);
      } else if (next is Error) {
        Navigator.pop(context);
        okDialog(context,
            content: StringUtils.somethingwrong,
            onPressed: () => Navigator.pop(context),
            isSuccess: false);
      }
    });

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: ColorUtils.primary,
        appBar: nomuraTextAppbar(),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(AppMargin.m32),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  titleText(StringUtils.enterLoginPin),
                  const Spacer(),
                  subtitleText(StringUtils.deregPIN),
                  const Spacer(),
                  CustomPinWidget(
                    pinController: pinController,
                    length: 6,
                    keyboardType: TextInputType.number,
                  ),
                  const Spacer(),
                ],
              ),
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
                  btnText: StringUtils.gotoContinue,
                  onTap: () async {
                    if (pinController.text.isNotEmpty) {
                      if (regExpNumberType(pinController.text.toString())) {
                        ref
                            .read(pinVerifyNotifierProvider.notifier)
                            .setUpPinVerify(pinController.text);
                      } else {
                        okDialog(context,
                            content: StringUtils.pinValidation,
                            onPressed: () => Navigator.pop(context),
                            isSuccess: false);
                      }
                    } else {
                      okDialog(
                        context,
                        content: StringUtils.pinEmpty,
                        onPressed: () => Navigator.pop(context),
                        isSuccess: false,
                      );
                    }
                  },
                ),
                const SizedBox(height: AppSize.s60),
                InkWell(
                  onTap: () {
                    ref.read(pinResultOriginProvider.notifier).update(
                          (state) => 'forgetPin',
                        );

                    SaveLocal().getUserid().then(
                      (username) {
                        SaveLocal()
                            .getIsBiometricEnrolled()
                            .then((isBiometricEnrolled) async {
                          final isBiometricEnabled =
                              await SaveLocal().getisBiometricEnabled();
                          int osversion = 0;
                          bool isAndroid = false;
                          if (Platform.isAndroid) {
                            isAndroid = true;
                            osversion = int.parse(await getDeviceOSLevel());
                          }
                          if (isBiometricEnrolled! && isBiometricEnabled!) {
                            loadingDialog(context);
                            SaveLocal().saveSelector(
                                isIOS ? "F1D0#1003" : "F1D0#0003");
                            SaveLocal().saveIsForgetPin(true);
                            loginInitializeMobileAuthenticationClient(
                              context: context,
                              authType: AuthType.forgetPIn,
                              dispatchTargets: [],
                              ref: ref,
                            );
                          } else if (isAndroid &&
                              osversion < 29 &&
                              isBiometricEnrolled &&
                              isBiometricEnabled!) {
                            SaveLocal().saveSelector(
                                isIOS ? "F1D0#1002" : "F1D0#0002");
                            SaveLocal().saveIsForgetPin(true);
                            loginInitializeMobileAuthenticationClient(
                              context: context,
                              authType: AuthType.forgetPIn,
                              dispatchTargets: [],
                              ref: ref,
                            );
                          } else {
                            loadingDialog(context);
                            ref
                                .read(usernameProvider.notifier)
                                .saveUserName(username);
                            ref
                                .read(legacyLoginNotifierProvider.notifier)
                                .legacyLoginFunc(
                                  ValidateUserParams(
                                    userName: username,
                                  ),
                                )
                                .whenComplete(() => Navigator.pop(context));
                          }
                        });
                      },
                    );
                  },
                  child: Text(
                    StringUtils.forgotPin,
                    style: getApplicationTheme().textTheme.bodyLarge!.copyWith(
                          decoration: TextDecoration.underline,
                          fontSize: 12,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
