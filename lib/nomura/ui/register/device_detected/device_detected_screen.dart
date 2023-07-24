import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/params/resend_sms.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/resend_mail/resend_mail_provider.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_button.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils.dart';

class DeviceDetectedScreen extends ConsumerWidget {
  const DeviceDetectedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userName = ref.watch(usernameProvider);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: ColorUtils.primary,
        appBar: nomuraAppbar(context),
        body: Container(
          margin: const EdgeInsets.all(AppMargin.m32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              titleText(
                StringUtils.wouldLikeContinue,
              ),
              const Spacer(),
              subtitleText(
                StringUtils.deviceDetected,
              ),
              const Spacer(),
              const Spacer(),
            ],
          ),
        ),
        persistentFooterButtons: [
          Container(
            padding: const EdgeInsets.all(AppPadding.p32),
            color: ColorUtils.primary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  btnText: StringUtils.gotoContinue,
                  onTap: () {
                    SaveLocal().saveDeregister(true);
                    ref
                        .read(resendMailNotifierProvider.notifier)
                        .resendMailFunc(
                          ResendSMSParams(
                            userName: userName,
                            generate: true,
                          ),
                        );
                  },
                ),
                const SizedBox(height: AppSize.s16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
