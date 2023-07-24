import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:nomura_mobile/nomura/domain/usecases/cancel_pin_operation_usecase.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_button.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_pin.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils/collection_utils.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/string_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

class ChangePinScreen extends ConsumerStatefulWidget {
  const ChangePinScreen({super.key});

  @override
  ConsumerState<ChangePinScreen> createState() => _ChangePinScreen();
}

class _ChangePinScreen extends ConsumerState<ChangePinScreen> {
  @override
  Widget build(BuildContext context) {
    var currentPin = ref.watch(currentPinProvider);
    debugPrint('current pin======> $currentPin');

    TextEditingController pinController = TextEditingController();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorUtils.primary,
        appBar: nomuraActionAppbar(context, press: () async {
          CancelPinOperationUseCase cancelPinOperationUseCase =
              GetIt.I<CancelPinOperationUseCase>();
          await cancelPinOperationUseCase.execute().whenComplete(() {
            // pinChangeCancelProvider;
            debugPrint("Cancel PIN OPE  ==>");
            ref.read(pinChangeCancelProvider.notifier).update(
                  (state) => true,
                );
          }).catchError((error) {
            // _errorHandler.handle(error);
            debugPrint("Cancel PIN OPE ERROR ==> $error");
          });
        }),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: AppMargin.m32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              titleText('Set up your new PIN \nto login'),
              const Spacer(),
              subtitleText(
                'Enter your new login PIN for Nomura Mobile App. Please remember your PIN.',
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
                  btnText: StringUtils.gotoContinue,
                  onTap: () {
                    if (pinController.text.isNotEmpty) {
                      if (regExpNumberType(pinController.text.toString())) {
                        if (pinController.text == currentPin) {
                          pinController.clear();
                          okDialog(
                            context,
                            content: StringUtils.sameOldPin,
                            onPressed: () => Navigator.pop(context),
                            isSuccess: false,
                          );
                        } else {
                          Navigator.pushNamed(
                            context,
                            Routes.changePinConfirmedRoute,
                            arguments: [
                              {
                                "currentPin": currentPin,
                                "changePin": pinController.text,
                                "error": ""
                              }
                            ],
                          );
                        }
                      } else {
                        pinController.clear();
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
    // return PinWidget(
    //   title: 'Set up your new PIN \nto login',
    //   subTitle:
    //       'Enter your new login PIN for Nomura Mobile App. Please remember your PIN.',
    //   onClicked: () async {
    //     if (pinController.text.isNotEmpty) {
    //       if (pinController.text.length < 6) {
    //         okDialog(
    //           context,
    //           content: StringUtils.enterPin,
    //           onPressed: () => Navigator.pop(context),
    //           isSuccess: false,
    //         );
    //       } else {
    //         debugPrint("PIN>>>>> $currentPin || ${pinController.text}");
    //         Navigator.pushReplacementNamed(
    //           context,
    //           Routes.changePinConfirmedRoute,
    //           arguments: [
    //             {"currentPin": currentPin, "changePin": pinController.text}
    //           ],
    //         );
    //       }
    //     } else {
    //       okDialog(
    //         context,
    //         content: StringUtils.pinEmpty,
    //         onPressed: () => Navigator.pop(context),
    //         isSuccess: false,
    //       );
    //     }

    //     // ProvidedPinsUseCase providedPinsUseCase =
    //     //     GetIt.I<ProvidedPinsUseCase>();

    //     // await providedPinsUseCase
    //     //     .execute(
    //     //   currentPin: currentPin,
    //     //   newPin: pinController.text,
    //     // )
    //     //     .catchError(
    //     //   (e) {
    //     //     debugPrint('$e');
    //     //   },
    //     // );
    //   },
    //   pinController: pinController,
    // );
  }
}
