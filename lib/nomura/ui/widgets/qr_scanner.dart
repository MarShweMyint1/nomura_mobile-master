import 'package:flutter/material.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

class QRScannerWidget extends StatelessWidget {
  const QRScannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushReplacementNamed(context, Routes.qrLoginRoute),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.qr_code_scanner,
          color: ColorUtils.primary,
          size: AppSize.s42,
        ),
      ),
    );
  }
}
