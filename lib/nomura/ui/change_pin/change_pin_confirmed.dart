import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:nomura_mobile/nomura/domain/usecases/provided_pins_usecase.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_button.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_pin.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils/collection_utils.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/string_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

class ChangePinConfirmScreen extends ConsumerStatefulWidget {
  const ChangePinConfirmScreen({required this.pin, super.key});
  final List pin;

  @override
  ConsumerState<ChangePinConfirmScreen> createState() =>
      _ChangePinConfirmScreen();
}

class _ChangePinConfirmScreen extends ConsumerState<ChangePinConfirmScreen> {
  @override
  void initState() {
    debugPrint("PIN ERROR SCREEN ==>> ${widget.pin[0]["error"]}");
    // checkPinError();
    super.initState();
  }

  // checkPinError() async {
  //   Future.delayed(const Duration(microseconds: 100), () {
  //     if (widget.pin[0]["error"] != "" ||
  //         widget.pin[0]["error"] == "null" ||
  //         widget.pin[0]["error"] == null) {
  //       okDialog(
  //         context,
  //         content: "${widget.pin[0]["error"]}",
  //         onPressed: () {
  //           Navigator.pop(context);
  //           Navigator.pop(context);
  //           Navigator.pop(context);
  //           Navigator.pop(context);
  //           Navigator.pushReplacementNamed(
  //             context,
  //             Routes.changeLoginPin,
  //           );
  //         },
  //         isSuccess: false,
  //       );
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    TextEditingController pinController = TextEditingController();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorUtils.primary,
        appBar: nomuraAppbar(context),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: AppMargin.m32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              titleText('Confirm your PIN'),
              const Spacer(),
              subtitleText(
                'Re-enter your PIN.',
              ),
              const Spacer(),
              const Spacer(),
              CustomPinWidget(
                pinController: pinController,
                isObscureText: true,
                keyboardType: TextInputType.number,
                errorText: StringUtils.verifyCodeEmpty,
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
                  btnText: StringUtils.confirm,
                  onTap: () async {
                    if (pinController.text.isNotEmpty) {
                      if (regExpNumberType(pinController.text.toString())) {
                        if (widget.pin[0]["changePin"] == pinController.text) {
                          ProvidedPinsUseCase providedPinsUseCase =
                              GetIt.I<ProvidedPinsUseCase>();

                          await providedPinsUseCase
                              .execute(
                            currentPin: '${widget.pin[0]["currentPin"]}',
                            newPin: pinController.text,
                          )
                              .catchError(
                            (e) {
                              debugPrint('Change PIN ERROR ==>> $e');
                            },
                          );
                        } else {
                          pinController.clear();
                          okDialog(context, content: StringUtils.pinNotMatch,
                              onPressed: () {
                            Navigator.pop(context);
                          }, isSuccess: false);
                        }
                      } else {
                        okDialog(
                          context,
                          content: StringUtils.validPin,
                          onPressed: () => Navigator.pop(context),
                          isSuccess: false,
                        );
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
                const SizedBox(height: AppSize.s16),
                // overAllText(
                //   StringUtils.didnotReceiveCode,
                //   textAlign: TextAlign.center,
                // ),
                // const SizedBox(height: AppSize.s12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
