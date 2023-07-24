import 'package:flutter/material.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/ui/widgets/successful_widget.dart';

class BiometricChangeSuccessfulScreen extends StatelessWidget {
  const BiometricChangeSuccessfulScreen(
      {super.key, required this.biometricState});
  final String biometricState;
  @override
  Widget build(BuildContext context) {
    return SuccessfulWidget(
      status: (biometricState == 'enableBio')
          ? 'Your biometric ID is successfully enabled!'
          :(biometricState=='disableBio')? 'Your biometric ID is successfully disabled!':(biometricState=='enableFingerprint')?'Your fingerprint ID is successfully enabled!':'Your fingerprint ID is successfully disabled!',
      onClicked: () {
        if (biometricState == 'enable'|| biometricState=='enableFingerprint') {
          SaveLocal().saveIsBiometricEnrolled(true);
        } else {
          SaveLocal().saveIsBiometricEnrolled(false);
        }
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
      },
      // onClicked: () => Navigator.pushNamedAndRemoveUntil(context, Routes.homeRoute, (route) => false),
    );
  }
}
