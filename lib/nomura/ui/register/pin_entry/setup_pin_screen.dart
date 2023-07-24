import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_button.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_pin.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils.dart';
import 'package:nomura_mobile/nomura/utils/collection_utils.dart';

class SetupPINScreen extends ConsumerStatefulWidget {
  const SetupPINScreen({
    super.key,
  });
  @override
  ConsumerState<SetupPINScreen> createState() => _SetupPINScreen();
}

class _SetupPINScreen extends ConsumerState<SetupPINScreen> {
  TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SetupPINWidget(
      pinController: pinController,
    );
  }

  // @override
  // void dispose() {
  //   pinController.clear();
  //   super.dispose();
  // }
}

class SetupPINWidget extends StatelessWidget {
  const SetupPINWidget({
    super.key,
    required this.pinController,
  });

  final TextEditingController pinController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorUtils.primary,
      appBar: nomuraTextAppbar(),
      body: Container(
        margin: const EdgeInsets.all(AppMargin.m32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            titleText(StringUtils.setupPin),
            const Spacer(),
            subtitleText(StringUtils.setupPinLogin),
            const Spacer(),
            CustomPinWidget(
              pinController: pinController,
              keyboardType: TextInputType.number,
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
                  if (pinController.text.isNotEmpty) {
                    if (regExpNumberType(pinController.text.toString())) {
                      Navigator.pushNamed(
                        context,
                        Routes.confirmPinRoute,
                        arguments: pinController.text,
                      );
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
              ),
              const SizedBox(height: AppSize.s32),
            ],
          ),
        ),
      ],
    );
  }
}
