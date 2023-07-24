import 'package:flutter/material.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/pin_widget.dart';
import 'package:nomura_mobile/nomura/utils/collection_utils.dart';
import 'package:nomura_mobile/nomura/utils/string_utils.dart';

class ResetPinScreen extends StatelessWidget {
  const ResetPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController pinController = TextEditingController();
    return PinWidget(
      title: 'Set up your PIN for\nlogin',
      subTitle:
          'Enter your new login PIN for Nomura Mobile App. Please remember your PIN.',
      onClicked: () {
        print('result pin in forget pin');
        if (pinController.text.isNotEmpty) {
          if (regExpNumberType(pinController.text.toString())) {
            Navigator.of(context).pushNamed(Routes.confirmResetPinRoute,
                arguments: pinController.text);
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
      pinController: pinController,
    );
  }
}
