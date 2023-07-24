import 'package:flutter/material.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/font_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

class WebViewSetting extends StatelessWidget {
  const WebViewSetting({
    super.key,
    required this.username,
    required this.isBiometric,
  });

  final String username;
  final bool isBiometric;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.s28),
                topRight: Radius.circular(AppSize.s28))),
        builder: (context) {
          return Container(
            height: 320,
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p18, vertical: AppPadding.p8),
            color: Colors.transparent,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                width: 70,
                height: 4,
                color: ColorUtils.grey,
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(AppPadding.p8),
                title: Text(
                  'User ID - $username',
                  style: TextStyle(
                      fontSize: FontSize.s22, color: ColorUtils.black),
                ),
              ),
              ListTile(
                shape: Border(
                    bottom: BorderSide(width: 0.5, color: ColorUtils.grey)),
                contentPadding: const EdgeInsets.all(AppPadding.p8),
                title: Text(
                  'Change Login PIN',
                  style: TextStyle(
                      fontSize: FontSize.s16, color: ColorUtils.black),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.changeLoginPin,
                  );
                },
              ),
              ListTile(
                shape: Border(
                    bottom: BorderSide(width: 0.5, color: ColorUtils.grey)),
                contentPadding: const EdgeInsets.all(AppPadding.p8),
                title: Text((isBiometric)?
                  'Manage Biometric Setting':'Manage fingerprint Setting',
                  style: TextStyle(
                      fontSize: FontSize.s16, color: ColorUtils.black),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushNamed(context, Routes.biometricSettingsRoute,arguments: isBiometric);
                },
              ),
              ListTile(
                // shape: Border(
                //     bottom: BorderSide(width: 0.5, color: ColorUtils.grey)),
                contentPadding: const EdgeInsets.all(AppPadding.p8),
                title: Text(
                  'Device Deregistration',
                  style: TextStyle(
                      fontSize: FontSize.s16, color: ColorUtils.black),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushNamed(context, Routes.pinDeregisterRoute);
                },
              ),
            ]),
          );
        },
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: ColorUtils.primary,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.settings, color: Colors.white),
            const SizedBox(width: 12),
            subtitleText('Settings'),
          ],
        ),
      ),
    );
  }
}
