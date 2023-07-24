import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/riverpod/legacy_proceed/legacy_proceed_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/legacy_proceed/legacy_proceed_state.dart';
import 'package:nomura_mobile/nomura/riverpod/resend_mail/resend_mail_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/resend_mail/resend_mail_state.dart'
    as mail;
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/forgot/reset_pin_verify_mail/reset_pin_verify_link_screen.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';

class ResetPinVerifyMailVm extends ConsumerWidget {
  const ResetPinVerifyMailVm({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<mail.ResendMailState>(resendMailNotifierProvider,
        (previous, next) {
      if (next is mail.Data) {
        if (next.data.code == "EMAIL_VERIFIED") {
          okDialog(context,
              content: next.data.message.toString(),
              onPressed: () => Navigator.pop(context),
              isSuccess: true);
        } else if (next.data.code == "USER_NOT_FOUND") {
          Navigator.pop(context);
          okDialog(context,
              content: next.data.message.toString(),
              onPressed: () => Navigator.pop(context),
              isSuccess: false);
        } else {
          Navigator.pop(context);
          okDialog(context,
              content: next.data.message.toString(),
              onPressed: () => Navigator.pop(context),
              isSuccess: false);
        }
      } else if (next is Error) {
        Navigator.pop(context);
        okDialog(context,
            content: "Something was wrong",
            onPressed: () => Navigator.pop(context),
            isSuccess: false);
      }
    });

    ref.listen<LegacyProceedState>(legacyProceedNotifierProvider,
        (previous, next) {
      if (next is Loading) {
        loadingDialog(context);
      } else if (next is Data) {
        Navigator.pop(context);
        if (next.data.name == 'MTANDialog') {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.resetPinVerifyCodeRoute,
            (Route<dynamic> route) => false,
          );
        }
      } else if (next is InvalidData) {
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
        } else if (next.invalidData.code == "USER_NOT_YET_VERIFY_MAIL") {
          okDialog(context,
              content: next.invalidData.message.toString(),
              onPressed: () => Navigator.pop(context),
              isSuccess: false);
        } else {
          okDialog(context,
              content: next.invalidData.message.toString(),
              onPressed: () => Navigator.pop(context),
              isSuccess: false);
        }
      } else if (next is Error) {
        Navigator.pop(context);
        okDialog(context,
            content: "Something was wrong",
            onPressed: () => Navigator.pop(context),
            isSuccess: false);
      }
    });
    return const ResetPinVerifyMailScreen();
  }
}
