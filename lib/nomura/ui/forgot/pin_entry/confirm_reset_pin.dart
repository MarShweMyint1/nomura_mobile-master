import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/riverpod/pin_entry/pin_entry_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/registration/registration_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/registration/registration_state.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_button.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_pin.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils/collection_utils.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/string_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

class ConfirmResetPin extends ConsumerWidget {
  const ConfirmResetPin({required this.pinNumber, super.key});
  final String pinNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController pinController = TextEditingController();
    ref.listen(registrationNotifierProvider, (pre, next) {
      if (next is Loading) {
        loadingDialog(context);
      } else if (next is Data) {}
    });
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: ColorUtils.primary,
        appBar: nomuraAppbar(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(AppMargin.m32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                titleText(StringUtils.confirmPin),
                const Spacer(),
                subtitleText(StringUtils.reenterPin),
                const Spacer(),
                CustomPinWidget(
                  pinController: pinController,
                  keyboardType: TextInputType.number,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        persistentFooterButtons: [
          Container(
            padding: const EdgeInsets.all(AppPadding.p32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  btnText: StringUtils.confirm,
                  onTap: () {
                    checkPinMatching(
                      confirmPinNumber: pinController,
                      context: context,
                      ref: ref,
                    );
                  },
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void checkPinMatching({
    required TextEditingController confirmPinNumber,
    required BuildContext context,
    required WidgetRef ref,
  }) {
    if (confirmPinNumber.text.isNotEmpty) {
      if (regExpNumberType(confirmPinNumber.text.toString())) {
        if (pinNumber == confirmPinNumber.text) {
          ref.read(pinEntryNotifierProvider.notifier).setUpPinEntry(pinNumber);
          confirmPinNumber.clear();
        } else {
          confirmPinNumber.clear();
          okDialog(context, content: StringUtils.pinNotMatch, onPressed: () {
            Navigator.pop(context);
          }, isSuccess: false);
        }
      } else {
        confirmPinNumber.clear();
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
  }
}
