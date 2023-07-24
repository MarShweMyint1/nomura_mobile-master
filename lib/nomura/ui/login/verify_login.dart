import 'package:flutter/material.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

class VerifyLogin extends StatelessWidget {
  const VerifyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.primary,
      appBar: nomuraTextAppbar(),
      body: Container(
        margin: const EdgeInsets.all(AppMargin.m32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            titleText("Verify Login"),
            const SizedBox(height: 32),
            subtitleText(
                "A login request has been sent to your registered device.  Please perform push message authentication."),
          ],
        ),
      ),
    );
  }
}
