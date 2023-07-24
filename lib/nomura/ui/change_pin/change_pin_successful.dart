import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/successful_widget.dart';

class ChangePinSuccessfulScreen extends ConsumerWidget {
  const ChangePinSuccessfulScreen({super.key, this.isForgetPin = false});
  final bool isForgetPin;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SuccessfulWidget(
        status: (isForgetPin)
            ? 'You have successfully reset the login PIN.'
            : 'You have successfully changed the login PIN.',
        onClicked: () async {
          debugPrint("CLICK CONTINUE ==>>");
          final pinResetOrigin = ref.read(pinResultOriginProvider);
          String token = await SaveLocal().getAuthToken();

          debugPrint('pin result===>$pinResetOrigin');
          SaveLocal().saveIsForgetPin(false);
          if (pinResetOrigin == 'changePin') {
            // ignore: use_build_context_synchronously
            Navigator.of(context).popUntil((route) => route.isFirst);
            // Navigator.pushNamedAndRemoveUntil(
            //   context,
            //   Routes.homeRoute,
            //   (route) => false,
            //   arguments: token,
            // );
          } else if (pinResetOrigin == 'forgetPinLogin') {
            // ignore: use_build_context_synchronously

            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.initRoute,
              (_) => false,
            );
          } else if (pinResetOrigin == 'forgetPinSetting') {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.homeRoute,
              (route) => false,
              arguments: token,
            );
          } else {
            // ignore: use_build_context_synchronously
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.homeRoute,
              (route) => false,
              arguments: token,
            );
          }

          // Navigator.pushNamedAndRemoveUntil(
          //   context,
          //   Routes.initRoute,
          //   (_) => false,
          // );

          // Navigator.pushNamedAndRemoveUntil(
          //     context, Routes, (route) => false);
        });
  }
}
