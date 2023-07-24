import 'package:flutter/material.dart';
import 'package:nomura_mobile/nomura/utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinWidget extends StatelessWidget {
  const CustomPinWidget(
      {super.key,
      required this.pinController,
      this.length = 6,
      this.isObscureText = true,
      this.keyboardType = TextInputType.text,
      this.errorText = "Pin cannot be empty."});
  final TextEditingController pinController;
  final int length;
  final bool isObscureText;
  final String errorText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      controller: pinController,
      autoFocus: false,
      length: length,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textStyle: const TextStyle(color: Colors.white),
      obscureText: isObscureText,
      obscuringCharacter: '*',
      blinkWhenObscuring: false,
      errorTextMargin: const EdgeInsets.only(top: AppMargin.m12),
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
          selectedColor: Colors.white,
          activeColor: ColorUtils.white,
          errorBorderColor: Colors.white,
          inactiveColor: Colors.white),
      cursorColor: Colors.white,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: false,
      keyboardType: keyboardType,
      onCompleted: (v) {},
      onChanged: (value) {},
      beforeTextPaste: (text) {
        debugPrint("Allowing to paste $text");
        return true;
      },
    );
  }
}
