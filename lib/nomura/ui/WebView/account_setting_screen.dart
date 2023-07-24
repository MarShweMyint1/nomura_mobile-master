import 'package:flutter/material.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/theme_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.primary,
      appBar: nomuraAppbar(context, actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p32,
            vertical: AppPadding.p32,
          ),
          child: Text(
            'User ID: USERA00001',
            style: getApplicationTheme().textTheme.bodySmall,
          ),
        ),
      ]),
      body: Container(
        margin: const EdgeInsets.only(top: AppMargin.m18),
        decoration: BoxDecoration(
          color: ColorUtils.black,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSize.s28),
            topRight: Radius.circular(AppSize.s28),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: AppMargin.m20,
                right: AppMargin.m20,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: ColorUtils.grey),
                ),
              ),
              child: ListTile(
                onTap: () =>
                    Navigator.pushNamed(context, Routes.changePinRoute),
                contentPadding: const EdgeInsets.all(AppPadding.p16),
                title: const Text('Change Login PIN'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorUtils.white,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: AppSize.s20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: ColorUtils.grey),
                ),
              ),
              child: ListTile(
                onTap: () =>
                    Navigator.pushNamed(context, Routes.biometricSettingsRoute),
                contentPadding: const EdgeInsets.all(AppPadding.p16),
                title: const Text('Manage Biometric Settings'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorUtils.white,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: AppSize.s20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: ColorUtils.grey),
                ),
              ),
              child: ListTile(
                onTap: () =>
                    Navigator.pushNamed(context, Routes.pinDeregisterRoute),
                contentPadding: const EdgeInsets.all(AppPadding.p16),
                title: const Text('Device Deregistration'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorUtils.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
