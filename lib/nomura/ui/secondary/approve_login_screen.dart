import 'package:flutter/material.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

class ApproveLoginScreen extends StatelessWidget {
  const ApproveLoginScreen({super.key});

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
            titleText(
              'Would you like to \nlogin to Nomura?',
            ),
            const Spacer(),
            subtitleText(
              'A login request has been detected from a new device. Is that you?',
            ),
            const Spacer(),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
      persistentFooterButtons: [
        Container(
          padding: const EdgeInsets.all(AppPadding.p32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppMargin.m18),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: AppSize.s28),
                  bodyText('No'),
                ],
              ),
              InkWell(
                onTap: () =>
                    Navigator.pushReplacementNamed(context, Routes.forgotRoute),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppMargin.m18),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: AppSize.s28),
                    bodyText('Yes'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
