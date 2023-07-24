import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/params/resend_sms.dart';
import 'package:nomura_mobile/nomura/data/params/validate_user.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/legacy_login/legacy_login_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/legacy_proceed/legacy_proceed_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/resend_mail/resend_mail_provider.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_button.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils.dart';

class ResetPinVerifyMailScreen extends ConsumerStatefulWidget {
  const ResetPinVerifyMailScreen({super.key,});
  @override
  ConsumerState<ResetPinVerifyMailScreen> createState() =>
      _BiometricSettingsScreenContentState();
}

class _BiometricSettingsScreenContentState
    extends ConsumerState<ResetPinVerifyMailScreen> {
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
    DateTime initTime = DateTime.now();
    DateTime? btmClickTime;
    int meanTime = 0;
    print("Start=>$_start");

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: ColorUtils.primary,
        appBar: nomuraTextAppbar(),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(AppMargin.m32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                titleText(StringUtils.verifyLinkSent),
                const Spacer(),
                subtitleText(
                     'Please check your registered mail ${user.userData.email} and click on the verification link to continue with PIN reset.'),
                const Spacer(),
                const Spacer(),
              ],
            ),
          ),
        ),
        persistentFooterButtons: [
          Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                    btnText: StringUtils.gotoContinue,
                    onTap: () {
                      debugPrint('username in rest pin verify mail ====>$userName');
                      btmClickTime = DateTime.now();

                      meanTime = btmClickTime!.difference(initTime).inMinutes;
                      if (meanTime < 10) {
                        ref
                            .read(legacyProceedNotifierProvider.notifier)
                            .legacyProceedFunc(
                              ValidateUserParams(userName: userName),
                            );
                      } else {
                        okDialog(context,
                            content: StringUtils.registrationTimeout,
                            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  Routes.usernameRoute,
                                  (route) => false,
                                ),
                            isSuccess: false);
                      }
                    }),
                const SizedBox(height: AppSize.s28),
                overAllText(
                  StringUtils.didnotReceiveLink,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSize.s12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (_start == 0 || _start == 10)
                        ? GestureDetector(
                            onTap: () {
                              startTimer();
                              ref
                                  .read(resendMailNotifierProvider.notifier)
                                  .resendMailFunc(
                                    ResendSMSParams(
                                      userName: userName,
                                      generate: true,
                                    ),
                                  );
                            },
                            child: Text(
                              StringUtils.sendLinkAgain,
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
                          )
                        : Text(
                            StringUtils.sendLinkAgain,
                            style: getApplicationTheme()
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  color: Colors.white70,
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                ),
                            textAlign: TextAlign.center,
                          ),
                    const SizedBox(width: AppPadding.p16),
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
                    // : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
