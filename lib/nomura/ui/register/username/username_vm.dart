import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/riverpod/legacy_login/legacy_login_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/legacy_login/legacy_login_state.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/register/username/username_screen.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';
import 'package:nomura_mobile/nomura/utils/string_utils.dart';

class UserNameVMScreen extends ConsumerWidget {
  const UserNameVMScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<LegacyState>(legacyLoginNotifierProvider, (pre, next) {
      if (next is Loading) {
        loadingDialog(context);
      }
      if (next is Data) {
        Navigator.pop(context);
        if (next.data.code == "USER_DECIDE_REMOVE_DEVICE") {
          Navigator.pushNamed(
            context,
            Routes.detectRoute,
          );
        } else if (next.data.code == "USER_NOT_FOUND") {
          okDialog(context,
              content: StringUtils.usernameValidation,
              onPressed: () => Navigator.pop(context),
              isSuccess: false);
        } else if (next.data.code == "EMAIL_FAILED_TO_SENT") {
          okDialog(context,
              content: next.data.message.toString(),
              onPressed: () => Navigator.pop(context),
              isSuccess: false);
        } else {
          Navigator.pop(context);
          Navigator.pushNamed(
            context,
            Routes.verifyLinkRoute,
          );
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
            content: "Something was wrong",
            onPressed: () => Navigator.pop(context),
            isSuccess: false);
      }
    });

    return const UserNameScreen();
  }
}
