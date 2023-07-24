import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/domain/operation/registration_operation.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/riverpod/authorize/authorize_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/resend_sms/resend_sms_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/submit_sms/submit_sms_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/submit_sms/submit_sms_state.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/forgot/reset_pin_verify_code/reset_pin_verify_code_screen.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';
import 'package:nomura_mobile/nomura/riverpod/resend_sms/resend_sms_state.dart'
    as resend;
import 'package:nomura_mobile/nomura/riverpod/authorize/authorize_state.dart'
    as authorize;
import 'package:nomura_mobile/nomura/utils/url_utils.dart';
import 'package:nomura_mobile/nomura/utils/constant_utils.dart';
import 'package:nomura_mobile/nomura/utils/string_utils.dart';

class ResetPinVerifyCodeVM extends ConsumerWidget {
  const ResetPinVerifyCodeVM({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userName = ref.watch(usernameProvider);
    ref.listen(authorizeNotifierProvider, (previous, next) async {
      if (next is authorize.Loading) {
        loadingDialog(context);
      } else if (next is authorize.Data) {
        if (next.isTrusted) {
          var cookies = ref.watch(cookieProvider);
          SaveLocal().saveSelector(isIOS ? "F1D0#1001" : "F1D0#0001");
          registrationOperation(
            userName,
            cookies,
            ref,
            UrlUtils.mailProceedEndPoint,
          );
        } else {
          Navigator.pop(context);
          okDialog(context,
              content: 'Unauthorized',
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.usernameRoute,
                    (Route<dynamic> route) => false,
                  ),
              isSuccess: false);
        }
      }
    });

    ref.listen<resend.ResendSMSState>(resendSMSNotifierProvider,
        (previous, next) {
      if (next is resend.Loading) {
        loadingDialog(context);
      }
      if (next is resend.Data) {
        Navigator.pop(context);
        if (next.data.name == 'MTANDialog') {
          okDialog(context,
              content: 'Code sent',
              onPressed: () => Navigator.pop(context),
              isSuccess: true);
        } else {}
      } else if (next is resend.InvalidData) {
        Navigator.pop(context);
        if (next.invalidData.code == "USER_NOT_FOUND") {
          okDialog(context,
              content: next.invalidData.message.toString(),
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.usernameRoute,
                    (Route<dynamic> route) => false,
                  ),
              isSuccess: false);
        } else if (next.invalidData.code == "FAILED_SMS_OTP") {
          okDialog(context,
              content: next.invalidData.message.toString(),
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.usernameRoute,
                    (Route<dynamic> route) => false,
                  ),
              isSuccess: false);
        } else if (next.invalidData.code == "USER_NOT_YET_VERIFY_MAIL") {
          okDialog(context,
              content: next.invalidData.message.toString(),
              onPressed: () => Navigator.pop(context),
              isSuccess: false);
        } else {}
      } else if (next is Error) {
        Navigator.pop(context);
        okDialog(context,
            content: "Something was wrong",
            onPressed: () => Navigator.pop(context),
            isSuccess: false);
      }
    });

    ref.listen<SubmitSMSState>(submitSMSNotifierProvider,
        (previous, next) async {
      if (next is Loading) {
        loadingDialog(context);
      } else if (next is Data) {
        Navigator.pop(context);
        if (next.data.code == "LEGACY_AUTHN_DONE") {
          ref.read(authorizeNotifierProvider.notifier).authorize(ref);
        } else if (next.data.code == "USER_NOT_FOUND") {
          okDialog(context,
              content: next.data.message.toString(),
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.usernameRoute,
                    (Route<dynamic> route) => false,
                  ),
              isSuccess: false);
        }
      } else if (next is InvalidData) {
        Navigator.pop(context);
        if (next.invalidData.name == "MTANDialog") {
          okDialog(context,
              content: 'Please check your input',
              onPressed: () => Navigator.pop(context),
              isSuccess: false);
        }
      } else if (next is Lock) {
        okDialog(
          context,
          content: StringUtils.tooManyAttempt,
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, Routes.usernameRoute, (route) => false),
          isSuccess: false,
        );
      } else if (next is Error) {
        Navigator.pop(context);
        okDialog(context,
            content: "Something was wrong",
            onPressed: () => Navigator.pop(context),
            isSuccess: false);
      }
    });
    return const ResetPinVerifyCodeScreen();
  }
}
