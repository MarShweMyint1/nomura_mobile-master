// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/app_state/app_bloc.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/string_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

class BiometricSettingsScreen extends ConsumerStatefulWidget {
  const BiometricSettingsScreen({super.key, required this.isBiometric});
  final bool isBiometric;

  @override
  ConsumerState<BiometricSettingsScreen> createState() =>
      _BiometricSettingsScreenContentState();
}

class _BiometricSettingsScreenContentState
    extends ConsumerState<BiometricSettingsScreen> {
  Set<Authenticator> _authenticators = {};
  String username = '';
  @override
  void initState() {
    print('isbiometric--->${widget.isBiometric}');

    SaveLocal().getUserid().then((username) async {
      debugPrint('user name==================$username');
      final isEnabled = await SaveLocal().getisBiometricEnabled();
      print('biometric enabled?==>>$isEnabled');
      final appBloc = GetIt.I<AppBloc>();
      await appBloc.registeredAuthenticators(username).then((value) {
        _authenticators = value;
        for (var element in _authenticators) {
          print('element aaid==>${element.aaid}');
          if (element.aaid.isBiometric) {
            SaveLocal().saveIsBiometricEnrolled(true);
            if (isEnabled ?? false) {
              ref.read(bioEnDisProvider.notifier).update((state) => true);
            } else {
              ref.read(bioEnDisProvider.notifier).update((state) => false);
            }
          } else {
            SaveLocal().saveIsBiometricEnrolled(false);
            ref.read(bioEnDisProvider.notifier).update((state) => false);
          }
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.primary,
      appBar: nomuraAppbar(context),
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
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        titleText((widget.isBiometric)
                            ? 'Enable biometric \nrecognition'
                            : 'Enable fingerprint \nrecognition'),
                        const CustomSwitch()
                      ],
                    ),
                    const SizedBox(height: 60),
                    subtitleText((widget.isBiometric)
                        ? StringUtils.biometricEnableText
                        : StringUtils.fingerPrintEnableText),
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

class CustomSwitch extends ConsumerWidget {
  const CustomSwitch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool toggleValue = ref.watch(bioEnDisProvider);
    double size = 30;
    double innerPadding = 3;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.confirmBiometricChangeRoute,
            arguments: !toggleValue);

        // Navigator.pushNamed(
        //     context,
        //     BiometricChangeConfirmScreen(
        //         isBiometricEnable: toggleValue,
        //         isBiometricEnrolled: isBiometricEnrolled,
        //         toggleValue: toggleValue));
        // final isBiometricEnrolled = await SaveLocal().getIsBiometricEnrolled();

        // if (isBiometricEnrolled != null) {
        //   if (!isBiometricEnrolled) {
        //     DeviceInformationUseCase deviceInformationUseCase =
        //         GetIt.I<DeviceInformationUseCase>();
        //     final deviceInformation = await deviceInformationUseCase.execute();

        //     final username = await SaveLocal().getUserid();
        //     final dispatchTargetId = deviceInformation?.idUsernamePairs
        //             .where((element) => element.username == username)
        //             .toList() ??
        //         [];

        //     ref
        //         .read(mobileClientAuthNotifierProvider.notifier)
        //         .mobileClientAuthFunc(
        //             MobileClientAuthParam(
        //                 isiwebuserid: dispatchTargetId.first.username,
        //                 dispatchTargetId: dispatchTargetId.first.identifier),
        //             ref);
        //   } else {
        //     await Future.delayed(const Duration(milliseconds: 500));
        //     //todo changes the local data
        //     debugPrint('biometric registered================>>');
        //     SaveLocal().saveisBiometricEnabled(toggleValue);
        //     if (toggleValue) {
        //       // ignore: use_build_context_synchronously
        //       Navigator.pushNamed(context, Routes.biometricenableSuccessRoute);
        //     } else {
        //       // ignore: use_build_context_synchronously
        //       Navigator.pushNamed(context, Routes.biometricdisableSuccessRoute);
        //     }
        //   }
        // }
      },
      child: AnimatedContainer(
        height: size,
        width: size * 1.8,
        padding: EdgeInsets.all(innerPadding),
        alignment: toggleValue ? Alignment.centerRight : Alignment.centerLeft,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: toggleValue ? Colors.green : Colors.black,
        ),
        child: Container(
          width: size - innerPadding * 2,
          height: size - innerPadding * 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
