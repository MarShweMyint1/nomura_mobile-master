import 'package:flutter/material.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/font_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

class BiometricDeregisterationScreen extends StatelessWidget {
  const BiometricDeregisterationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.primary,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: AppMargin.m32,
                  vertical: AppMargin.m32,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          "assets/back.png",
                          height: AppSize.s28,
                          width: AppSize.s28,
                          color: ColorUtils.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(AppMargin.m32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Scan Face ID',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: FontSize.s32,
                      ),
                    ),
                    const SizedBox(height: 60),
                    const Text(
                      'Complete the registration process by adding Face ID.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: FontSize.s16,
                      ),
                    ),
                    const SizedBox(height: 50),
                    InkWell(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, Routes.successfulRegisterRoute),
                      child: Container(
                        padding: const EdgeInsets.all(AppPadding.p50),
                        margin: const EdgeInsets.all(AppMargin.m16),
                        // color: ColorUtils.lighDark.withOpacity(0.3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorUtils.lighDark.withOpacity(0.3),
                          // boxShadow: [
                          //   BoxShadow(color: Colors.green, spreadRadius: 3),
                          // ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/faceid.png',
                              height: 100,
                              width: 100,
                            ),
                            const SizedBox(
                              height: AppSize.s20,
                            ),
                            const Text(
                              'Face ID',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: FontSize.s16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
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
