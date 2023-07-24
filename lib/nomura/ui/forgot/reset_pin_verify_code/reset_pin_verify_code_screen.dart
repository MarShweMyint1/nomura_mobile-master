import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/params/resend_sms.dart';
import 'package:nomura_mobile/nomura/data/params/submit_sms.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/legacy_login/legacy_login_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/resend_sms/resend_sms_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/submit_sms/submit_sms_provider.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_button.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_pin.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils.dart';
import 'package:nomura_mobile/nomura/utils/collection_utils.dart';

class ResetPinVerifyCodeScreen extends ConsumerStatefulWidget {
  const ResetPinVerifyCodeScreen({super.key});
  @override
  ConsumerState<ResetPinVerifyCodeScreen> createState() => _VerifyCodeScreen();
}

class _VerifyCodeScreen extends ConsumerState<ResetPinVerifyCodeScreen> {
  TextEditingController otp = TextEditingController();
  Timer timer = Timer(Duration.zero, () {});
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  int _start = 10;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _start = 10;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var userName = ref.watch(usernameProvider);
    var user = ref.watch(legacyLoginNotifierProvider.notifier);
    final count = ref.watch(counterProvider);
    DateTime initTime = DateTime.now();
    DateTime? btmClickTime;
    int meanTime = 0;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorUtils.primary,
        appBar: nomuraTextAppbar(),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: AppMargin.m32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              titleText(StringUtils.verifyCodeSent),
              const Spacer(),
              subtitleText(
                '${StringUtils.enterotp} ${user.userData.mobile}.',
              ),
              const Spacer(),
              const Spacer(),
              CustomPinWidget(
                pinController: otp,
                isObscureText: false,
                errorText: StringUtils.verifyCodeEmpty,
              ),
              const Spacer(),
            ],
          ),
        ),
        persistentFooterButtons: [
          Container(
            padding: const EdgeInsets.all(AppPadding.p24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  btnText: StringUtils.gotoContinue,
                  onTap: () {
                    print('result pin verify code');
                    if (otp.text.isNotEmpty) {
                      if (regExpVarType(otp.text.toString())) {
                        btmClickTime = DateTime.now();
                        meanTime = btmClickTime!.difference(initTime).inMinutes;
                        if (meanTime < 5) {
                          ref.read(counterProvider.notifier).increment();
                          if (count > 6) {
                            okDialog(
                              context,
                              content: StringUtils.tooManyAttempt,
                              onPressed: () =>
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      Routes.usernameRoute, (route) => false),
                              isSuccess: false,
                            );
                            otp.clear();
                          } else {
                            ref
                                .read(submitSMSNotifierProvider.notifier)
                                .submittedSMS(
                                  SubmitSMSParams(
                                    userName: userName,
                                    otpCode: otp.text,
                                  ),
                                  ref,
                                );
                            otp.clear();
                          }
                        } else {
                          okDialog(context,
                              content: StringUtils.smsTimeout,
                              onPressed: () =>
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      Routes.usernameRoute, (route) => false),
                              isSuccess: false);
                          otp.clear();
                        }
                      } else {
                        okDialog(context,
                            content: StringUtils.otpAlert,
                            onPressed: () => Navigator.pop(context),
                            isSuccess: false);
                        otp.clear();
                      }
                    } else {
                      okDialog(
                        context,
                        content: StringUtils.verifyCodeEmpty,
                        onPressed: () => Navigator.pop(context),
                        isSuccess: false,
                      );
                    }
                  },
                ),
                const SizedBox(height: AppSize.s16),
                overAllText(
                  StringUtils.didnotReceiveCode,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSize.s12),
                (_start == 0 || _start == 10)
                    ? Text(
                        StringUtils.sendCodeAgain,
                        style:
                            getApplicationTheme().textTheme.bodyLarge!.copyWith(
                                  color: Colors.white70,
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                ),
                        textAlign: TextAlign.center,
                      )
                    : GestureDetector(
                        onTap: () {
                          ref.read(counterResendProvider.notifier).increment();
                          ref
                              .read(resendSMSNotifierProvider.notifier)
                              .resendSMSFunc(
                                ResendSMSParams(
                                  userName: userName,
                                  generate: true,
                                ),
                              );
                        },
                        child: Text(
                          StringUtils.sendCodeAgain,
                          style: getApplicationTheme()
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                color: Colors.white,
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                // (_start < 10 && _start > 0)
                //     ? Container(
                //         padding: const EdgeInsets.all(AppPadding.p8),
                //         decoration: BoxDecoration(
                //           shape: BoxShape.circle,
                //           border: Border.all(width: 1, color: Colors.white),
                //         ),
                //         clipBehavior: Clip.antiAliasWithSaveLayer,
                //         child: Text(
                //           _start.toString(),
                //           style: getApplicationTheme().textTheme.bodySmall!,
                //         ),
                //       )
                //     : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   otp.clear();
  //   super.dispose();
  // }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
