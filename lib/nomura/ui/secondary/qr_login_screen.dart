import 'package:flutter/material.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/font_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

class QRLoginScreen extends StatelessWidget {
  const QRLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.primary,
      appBar: nomuraTextAppbar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(AppMargin.m32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Verify Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: FontSize.s32,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'A login request have been sent to your registered device. Please perform push message authentication.\n\n\n (OR)\n\n\n Scan the following QR code using your registered device.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: FontSize.s16,
                      ),
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () => Navigator.pushReplacementNamed(
                        context,
                        Routes.approveLoginRoute,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(AppPadding.p12),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.qr_code_2,
                          size: 300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
