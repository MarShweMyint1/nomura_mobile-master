import 'package:flutter/material.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

class FaceIDWidget extends StatelessWidget {
  const FaceIDWidget({super.key, required this.ontap});
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p50),
        margin: const EdgeInsets.all(AppMargin.m20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorUtils.lighDark.withOpacity(0.3),
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
            subtitleText("Face ID")
          ],
        ),
      ),
    );
  }
}
