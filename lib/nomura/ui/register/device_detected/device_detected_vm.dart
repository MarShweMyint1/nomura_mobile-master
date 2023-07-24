import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/riverpod/resend_mail/resend_mail_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/resend_mail/resend_mail_state.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/register/device_detected/device_detected_screen.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';

class DeviceDetectedVM extends ConsumerWidget {
  const DeviceDetectedVM({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<ResendMailState>(
      resendMailNotifierProvider,
      (previous, next) {
        if (next is Loading) {
          loadingDialog(context);
        }

        if (next is Data) {
          Navigator.pop(context);
          if (next.data.code == "EMAIL_VERIFIED") {
            Navigator.pushReplacementNamed(
              context,
              Routes.verifyLinkRoute,
            );
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
        } else if (next is Error) {
          Navigator.pop(context);
          okDialog(context,
              content: "Something was wrong",
              onPressed: () => Navigator.pop(context),
              isSuccess: false);
        }
      },
    );

    return const DeviceDetectedScreen();
  }
}
