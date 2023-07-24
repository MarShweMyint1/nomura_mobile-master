import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/params/select_authenticator_parameter.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/pin_entry/pin_entry_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/pin_entry/pin_entry_state.dart';
import 'package:nomura_mobile/nomura/riverpod/result/result_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/result/result_state.dart'
    as result;
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_button.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_pin.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils.dart';
import 'package:nomura_mobile/nomura/utils/collection_utils.dart';
import 'package:nomura_mobile/nomura/utils/constant_utils.dart';
import 'package:nomura_mobile/nomura/utils/device_detail.dart';

class ConfirmedPinScreen extends ConsumerStatefulWidget {
  const ConfirmedPinScreen({super.key, required this.pinNumber});
  final String pinNumber;
  @override
  ConsumerState<ConfirmedPinScreen> createState() => _ConfirmedPinScreen();
}

class _ConfirmedPinScreen extends ConsumerState<ConfirmedPinScreen> {
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var username = ref.watch(usernameProvider);
    ref.listen(pinEntryNotifierProvider, (_, next) {
      if (next is Loading) {
        loadingDialog(context);
      } else if (next is Data) {
        Navigator.pop(context);
      } else {
        Navigator.pop(context);
      }
    });

    ref.listen(resultNotifierProvider, (prev, next) async {
      var osversion = 0;
      if (Platform.isAndroid) {
        osversion = int.parse(await getDeviceOSLevel());
      }

      if (next is result.Loading) {
        // ignore: use_build_context_synchronously
        loadingDialog(context);
      } else if (next is result.PinData) {
        Navigator.pop(context);
        if ((osversion < 29) && Platform.isAndroid) {
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(
            context,
            Routes.fingerprintRoute,
            arguments: SelectAuthenticatorParameter(
              aaid: isIOS ? "F1D0#1002" : "F1D0#0002",
              operationType: OperationType.registration,
              username: username,
            ),
          );
        } else {
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(
            context,
            Routes.setupBiometricRoute,
            arguments: SelectAuthenticatorParameter(
              aaid: isIOS ? "F1D0#1003" : "F1D0#0003",
              operationType: OperationType.registration,
              username: username,
            ),
          );
        }
      }
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
        if (widget.pinNumber == confirmPinNumber.text) {
          ref
              .read(pinEntryNotifierProvider.notifier)
              .setUpPinEntry(widget.pinNumber);
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

  // @override
  // void dispose() {
  //   pinController.clear();
  //   super.dispose();
  // }
}
