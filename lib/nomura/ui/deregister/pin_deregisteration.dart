import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/params/validate_user.dart';
import 'package:nomura_mobile/nomura/domain/operation/deregistration_client.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/device_check_primality/device_check_primality_provider.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_button.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/constant_utils.dart';
import 'package:nomura_mobile/nomura/utils/device_detail.dart';
import 'package:nomura_mobile/nomura/utils/enumeration.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';
import 'package:nomura_mobile/nomura/riverpod/device_check_primality/device_check_primality_state.dart'
    as check;

class PinDeregisterationScreen extends ConsumerStatefulWidget {
  const PinDeregisterationScreen({super.key});

  @override
  ConsumerState<PinDeregisterationScreen> createState() =>
      _PinDeregisterationScreenState();
}

class _PinDeregisterationScreenState
    extends ConsumerState<PinDeregisterationScreen> {
  var hasBiometric = false;
  @override
  void initState() {
    getSupportBio();
    super.initState();
  }

  getSupportBio() async {
    await SaveLocal().getSupportedDevice().then((value) {
      hasBiometric = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<check.DeviceCheckPrimalityState>(
        deviceCheckPrimalityNotifierProvider, (previous, next) async {
      if (next is check.Loading) {
        loadingDialog(context);
      }
      if (next is check.Data) {
        Navigator.pop(context);
        List dispatchTargetsList = next.data.dispatchTargets!.toList();
        ref
            .read(dispatchTargetProvider.notifier)
            .saveDispatchTarget(dispatchTargetsList);
        deregistrationClient(
            dispatchTargets: dispatchTargetsList,
            authType: AuthType.deregistration,
            ref: ref,
            context: context);
        // loginOperation(
        //   dispatchTargetsList,
        //   AuthType.deregistration,
        //   ref,
        //   context,
        // );
      } else if (next is check.NoPrimaryDevice) {
        debugPrint('no primary device==============>>');
        // Navigator.pop(context);
        okDialog(context,
            content:
                next.data.message ?? 'No primary device is found for the user',
            onPressed: () => Navigator.pushNamed(context, Routes.usernameRoute),
            isSuccess: false);
      } else if (next is Error) {
        Navigator.pop(context);
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorUtils.primary,
      appBar: nomuraAppbar(context),
      body: Container(
        margin: const EdgeInsets.all(AppMargin.m32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            titleText("Are you sure you want to \nderegister this device?"),
            const Spacer(),
            subtitleText(
                "If you proceed with deregistering this device, you will no longer have access to the app from this device. You will need to complete the registration process again if you want to access the app from this device."),
            const Spacer(),
          ],
        ),
      ),
      persistentFooterButtons: [
        Container(
          padding: const EdgeInsets.all(AppPadding.p24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                  btnText: 'Confirm',
                  onTap: () async {
                    //! Device Deregistration
                    var username = await SaveLocal().getUserid();
                    debugPrint("DEREGISTER ====>>>> $username");

                    bool isBiometricEnabled =
                        await SaveLocal().getisBiometricEnabled() ?? false;
                    debugPrint(
                        "DEREGISTER BIO ====>>>> $isBiometricEnabled || $hasBiometric");
                    bool isBiometricEnrolled =
                        await SaveLocal().getIsBiometricEnrolled() ?? false;
                    int osversion = 0;
                    bool isAndroid = false;
                    if (Platform.isAndroid) {
                      isAndroid = true;
                      osversion = int.parse(await getDeviceOSLevel());
                    }

                    if (username.isNotEmpty) {
                      if (hasBiometric && isBiometricEnabled) {
                        SaveLocal()
                            .saveSelector(isIOS ? "F1D0#1003" : "F1D0#0003");
                      } else if (isAndroid &&
                          osversion < 29 &&
                          isBiometricEnrolled &&
                          isBiometricEnabled) {
                        SaveLocal()
                            .saveSelector(isIOS ? "F1D0#1002" : "F1D0#0002");
                      } else {
                        SaveLocal()
                            .saveSelector(isIOS ? "F1D0#1001" : "F1D0#0001");
                      }

                      ref
                          .read(deviceCheckPrimalityNotifierProvider.notifier)
                          .deviceCheckPrimalityFunc(
                            ValidateUserParams(
                              userName: username,
                            ),
                          );
                    }
                  }),
              const SizedBox(height: AppSize.s32),
            ],
          ),
        ),
      ],
    );
  }
}
