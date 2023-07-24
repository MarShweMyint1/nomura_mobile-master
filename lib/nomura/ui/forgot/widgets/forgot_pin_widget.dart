// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/params/resend_sms.dart';
import 'package:nomura_mobile/nomura/data/params/validate_user.dart';
import 'package:nomura_mobile/nomura/domain/operation/forgot_client.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/legacy_login/legacy_login_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/legacy_login/legacy_login_state.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';
import 'package:nomura_mobile/nomura/utils.dart';
import 'package:nomura_mobile/nomura/utils/constant_utils.dart';
import 'package:nomura_mobile/nomura/riverpod/resend_mail/resend_mail_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/resend_mail/resend_mail_state.dart'
    as resend_mail;
import 'package:nomura_mobile/nomura/utils/device_detail.dart';

class ForgotPinWidget extends ConsumerWidget {
  const ForgotPinWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            Navigator.pushReplacementNamed(
                context, Routes.resetPinVerifyMailRoute,
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
        debugPrint('next is ${next.data.code}');

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
        okDialog(context,
            content: "Something was wrong",
            onPressed: () => Navigator.pop(context),
            isSuccess: false);
      }
    });
    return InkWell(
      onTap: () {
        // CancelUserInteractionOperationUseCase
        //     cancelUserInteractionOperationUseCase =
        //     GetIt.I<CancelUserInteractionOperationUseCase>();
        // cancelUserInteractionOperationUseCase.execute().catchError((error) {
        //   print('cancel operation error==>$error');
        // });

        ref.read(pinResultOriginProvider.notifier).update(
              (state) => 'forgetPinSetting',
            );
        // var skipBiometric = ref.read(isSkipBiometricProvider);

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
              print('isbiometric enrolled ===>$isBiometricEnrolled');
              print('is biometric enabled ===>$isBiometricEnabled');
              if (isBiometricEnrolled! && isBiometricEnabled!) {
                loadingDialog(context);
                SaveLocal().saveSelector(isIOS ? "F1D0#1003" : "F1D0#0003");
                SaveLocal().saveIsForgetPin(true);
                forgotPinClient(context: context, ref: ref);
                // loginInitializeMobileAuthenticationClient(
                //   context: context,
                //   authType: AuthType.forgetPIn,
                //   dispatchTargets: [],
                //   ref: ref,
                // );
              } else if (isAndroid &&
                  osversion < 29 &&
                  isBiometricEnrolled &&
                  isBiometricEnabled!) {
                SaveLocal().saveSelector(isIOS ? "F1D0#1002" : "F1D0#0002");
                SaveLocal().saveIsForgetPin(true);
                // loginInitializeMobileAuthenticationClient(
                //   context: context,
                //   authType: AuthType.forgetPIn,
                //   dispatchTargets: [],
                //   ref: ref,
                // );
              } else {
                loadingDialog(context);
                ref.read(usernameProvider.notifier).saveUserName(username);
                ref
                    .read(legacyLoginNotifierProvider.notifier)
                    .legacyLoginFunc(
                      ValidateUserParams(
                        userName: username,
                      ),
                    )
                    .whenComplete(() => Navigator.pop(context));
              }
              // if (isBiometricEnrolled ?? false) {
              //   loadingDialog(context);
              //   SaveLocal().saveSelector(isIOS ? "F1D0#1003" : "F1D0#0003");
              //   SaveLocal().saveIsForgetPin(true);
              //   loginInitializeMobileAuthenticationClient(
              //     context: context,
              //     authType: "forgetpin",
              //     dispatchTargets: [],
              //     ref: ref,
              //     // isForgetPin: true
              //   );
              // } else {
              //   loadingDialog(context);
              //   ref.read(usernameProvider.notifier).saveUserName(username);
              //   ref
              //       .read(legacyLoginNotifierProvider.notifier)
              //       .legacyLoginFunc(
              //         ValidateUserParams(
              //           userName: username,
              //         ),
              //       )
              //       .whenComplete(() => Navigator.pop(context));
              // }
            });
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: AppPadding.p32),
        child: Text(
          StringUtils.forgotPin,
          style: getApplicationTheme().textTheme.bodyLarge!.copyWith(
                decoration: TextDecoration.underline,
                fontSize: 12,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
