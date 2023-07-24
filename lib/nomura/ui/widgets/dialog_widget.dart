import 'package:flutter/material.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/theme_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

okDialog(
  BuildContext context, {
  required String content,
  required Function() onPressed,
  required isSuccess,
  String? btnText,
}) =>
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12)),
        titlePadding: const EdgeInsets.all(0),
        title: Container(
            height: 9,
            decoration: BoxDecoration(
                color: (isSuccess) ? ColorUtils.boldGreen : ColorUtils.ligthRed,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s12),
                    topRight: Radius.circular(AppSize.s12)))),
        actionsPadding: const EdgeInsets.all(0),
        content: Container(
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                (isSuccess) ? 'assets/successful.png' : 'assets/warning.png',
                width: 60,
                height: 60,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: AppMargin.m20),
                child: Text(
                  content,
                  style: getApplicationTheme()
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 43,
            decoration: BoxDecoration(
                color: (isSuccess) ? ColorUtils.boldGreen : ColorUtils.primary,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(AppSize.s12),
                    bottomRight: Radius.circular(AppSize.s12))),
            child: TextButton(
              onPressed: onPressed,
              child: Text(
                (btnText == null) ? 'OK' : btnText,
                style: getApplicationTheme()
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );

loadingDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorUtils.black.withOpacity(0.4),
            ),
            width: 80,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(23.0),
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
                color: ColorUtils.white,
              ),
            ),
          ),
        );
      },
    );

errorDialog(
  BuildContext context, {
  required String content,
  required Function() onPressed,
}) =>
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12)),
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          height: 9,
          decoration: BoxDecoration(
            color: ColorUtils.ligthRed,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.s12),
                topRight: Radius.circular(AppSize.s12)),
          ),
        ),
        actionsPadding: const EdgeInsets.all(0),
        content: Container(
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/warning.png',
                width: 60,
                height: 60,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: AppMargin.m20),
                child: Text(
                  content,
                  style: getApplicationTheme()
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 43,
            decoration: BoxDecoration(
                color: ColorUtils.primary,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(AppSize.s12),
                    bottomRight: Radius.circular(AppSize.s12))),
            child: TextButton(
              onPressed: onPressed,
              child: Text(
                'OK',
                style: getApplicationTheme()
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );

fingerprintPrompted(BuildContext context) => showModalBottomSheet(
    context: context,
    isDismissible: false,
    clipBehavior: Clip.hardEdge,
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p50,
          horizontal: AppMargin.m32,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Authentication Required",
              style: getApplicationTheme()
                  .textTheme
                  .displaySmall!
                  .copyWith(color: ColorUtils.primary),
            ),
            const SizedBox(height: AppMargin.m24),
            Text(
              " Please confirm your fingerprint to login",
              style: getApplicationTheme().textTheme.bodyLarge!.copyWith(
                    color: ColorUtils.textBlack,
                  ),
            ),
            const SizedBox(height: AppMargin.m32),
            Row(
              children: [
                Icon(
                  Icons.fingerprint,
                  size: 80,
                  color: ColorUtils.primary,
                ),
                const SizedBox(width: AppPadding.p24),
                Text(
                  "Touch sensor",
                  style: getApplicationTheme().textTheme.bodyLarge!.copyWith(
                        color: ColorUtils.textBlack,
                      ),
                ),
              ],
            ),
          ],
        ),
      );
    });
