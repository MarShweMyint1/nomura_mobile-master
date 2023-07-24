import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utils/color_utils.dart';
import '../../utils/font_utils.dart';
import '../../utils/values_utils.dart';

class ConfirmDeregisterScreen extends StatelessWidget {
  const ConfirmDeregisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController pincodeCtrl = TextEditingController();

    return Scaffold(
        backgroundColor: ColorUtils.primary,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: AppPadding.p50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      margin: const EdgeInsets.only(
                          left: AppMargin.m20,
                          bottom: AppMargin.m50),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: ColorUtils.white,
                          borderRadius: BorderRadius.circular(AppSize.s10)),
                      child: Image.asset(
                        "assets/back.png",
                        height: AppSize.s28,
                        width: AppSize.s28,
                        color: ColorUtils.primary,
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: AppMargin.m32, top: AppMargin.m60),
                  child: Text(
                    'Are you sure you want to deregister this device?',
                    style: TextStyle(
                        fontSize: FontSize.s29, color: ColorUtils.white),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: AppMargin.m32,
                      top: AppMargin.m16,
                      bottom: AppMargin.m50,
                      right: AppMargin.m20),
                  child: Text(
                    'If you proceed with deregistering this device,you will no longer have access to the app from this device. You will need to complete the registartion process again if you want to access the app from this device. To continue, please enter your login PIN for verification.',
                    style: TextStyle(
                        fontSize: FontSize.s16,
                        color: ColorUtils.white,
                        fontWeight: FontWeightUtils.light),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: AppMargin.m32),
                  decoration: BoxDecoration(
                      color: ColorUtils.lightGrey,
                      borderRadius: BorderRadius.circular(AppSize.s20)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(AppPadding.p16),
                    title: Row(children: [
                      Icon(
                        Icons.phone_android,
                        color: ColorUtils.yellow,
                      ),
                      const SizedBox(
                        width: AppSize.s12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Iphone 12 Pro . California, United States',
                            style: TextStyle(
                                fontSize: FontSize.s14,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeightUtils.light),
                          ),
                          const SizedBox(
                            height: AppSize.s12,
                          ),
                          Text(
                            'About an hour ago',
                            style: TextStyle(color: ColorUtils.grey),
                          )
                        ],
                      )
                    ]),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s47,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: AppMargin.m32),
                  child: PinCodeTextField(
                    appContext: context,
                    controller: pincodeCtrl,
                    length: 6,
                    textStyle: const TextStyle(color: Colors.white),
                    obscureText: false,
                    obscuringCharacter: '*',
                    blinkWhenObscuring: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                        selectedColor: Colors.amberAccent,
                        activeColor: ColorUtils.lightprimary,
                        inactiveColor: Colors.white),
                    cursorColor: Colors.white,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: false,
                    keyboardType: TextInputType.number,
                    onCompleted: (v) {},
                    onChanged: (value) {},
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      return true;
                    },
                  ),
                ),
                const SizedBox(
                  height: AppSize.s42,
                ),
                Center(
                  child: MaterialButton(
                    onPressed: () {},
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s20)),
                    height: 55,
                    color: ColorUtils.white,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: ColorUtils.primary,
                        ),
                        Text(
                          '  Continue',
                          style: TextStyle(
                              color: ColorUtils.primary,
                              fontSize: FontSize.s20),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s100,
                )
              ],
            ),
          ),
        ));
  }
}
