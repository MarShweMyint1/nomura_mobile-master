import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_button.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_pin.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

class PinWidget extends ConsumerWidget {
  const PinWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onClicked,
    this.action,
    required this.pinController,
  });
  final String title;
  final String subTitle;
  final Function() onClicked;
  final Widget? action;
  final TextEditingController pinController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorUtils.primary,
      appBar: nomuraTextAppbar(),
      body: Container(
        margin: const EdgeInsets.all(AppMargin.m32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            titleText(title),
            const Spacer(),
            subtitleText(subTitle),
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
              CustomButton(btnText: StringUtils.confirm, onTap: onClicked),
              const SizedBox(height: AppSize.s32),
              const SizedBox(height: AppSize.s32),
              action ?? const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}
