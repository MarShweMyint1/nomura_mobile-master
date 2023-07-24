import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:nomura_mobile/nomura/data/params/mobile_client_auth_param.dart';
import 'package:nomura_mobile/nomura/domain/operation/registration_operation_change_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/domain/usecases/device_information_usecase.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/mobile_client_auth/mobile_client_auth_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/mobile_client_auth/mobile_client_auth_state.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_button.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils/assets_utils.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/constant_utils.dart';
import 'package:nomura_mobile/nomura/utils/string_utils.dart';
import 'package:nomura_mobile/nomura/utils/url_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

class BiometricChangeConfirmScreen extends ConsumerWidget {
  const BiometricChangeConfirmScreen({super.key, required this.toggleValue});
  final bool toggleValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBiometric = ref.watch(isBiometricProvider);
    ref.listen<MobileClientAuthState>(mobileClientAuthNotifierProvider,
        (previous, next) async {
      if (next is Loading) {
        loadingDialog(context);
      }
      if (next is Data) {
        Navigator.pop(context);
        if (next.data.code == "CLIENT_AUTHN_DONE") {
          debugPrint('client auth done==');

          var cookies = ref.watch(cookieProvider);
          final username = await SaveLocal().getUserid();
          debugPrint('username in data==>$username');
          SaveLocal().saveSelector((isBiometric)
              ? isIOS
                  ? 'F1D0#1003'
                  : 'F1D0#0003'
              : isIOS
                  ? 'F1D0#1002'
                  : 'F1D0#0002');
          // registrationOperationChangeSdk(username, cookies.toList(), ref,
          //     UrlUtils.mobileClientAuthEndPoint);
          print('isbiometric ->$isBiometric');
          registrationOperationChangeSdk(
              username: username,
              cookiesList: cookies.toList(),
              ref: ref,
              cookieEndPoint: UrlUtils.mobileClientAuthEndPoint,
              isBiometric: isBiometric);
          // registrationOperation(username, cookies.toList(), ref,
          //     UrlUtils.mobileClientAuthEndPoint, true);
        } else {
          okDialog(context,
              content:
                  next.data.message ?? "Failed mobile client authentication",
              onPressed: () => Navigator.pop(context),
              isSuccess: false);
        }
      }
    });
    return Scaffold(
      backgroundColor: ColorUtils.primary,
      appBar: nomuraAppbar(context),
      body: Container(
        margin: const EdgeInsets.all(AppMargin.m32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            titleText(
              (toggleValue)
                  ? (isBiometric)
                      ? 'Are you sure you want to enable the biometric recognition?'
                      : 'Are you sure you want to enable the fingerprint recognition?'
                  : (isBiometric)
                      ? 'Are you sure you want to disable the biometric recognition?'
                      : 'Are you sure you want to disable the fingerprint recognition?',
            ),
            const Spacer(),
            subtitleText((toggleValue)
                ? (isBiometric)
                    ? 'Please confirm to enable biometric recognition'
                    : 'Please confirm to enable fingerprint recognition'
                : (isBiometric)
                    ? 'Please confirm to disable biometric recognition'
                    : 'Please confirm to disable fingerprint recognition'),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
      persistentFooterButtons: [
        Container(
          padding: const EdgeInsets.all(AppPadding.p32),
          color: ColorUtils.primary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                  btnText: StringUtils.confirm,
                  widget: Image.asset(
                    AssetManager.faceIdBlack,
                    height: 20,
                    width: 20,
                    fit: BoxFit.contain,
                  ),
                  // icon: Icons.face_id,
                  onTap: () async {
                    ref.read(bioEnDisProvider.notifier).update(
                          (state) => !state,
                        );
                    final isBiometricEnrolled =
                        await SaveLocal().getIsBiometricEnrolled();
                    if (isBiometricEnrolled != null) {
                      if (!isBiometricEnrolled) {
                        DeviceInformationUseCase deviceInformationUseCase =
                            GetIt.I<DeviceInformationUseCase>();
                        final deviceInformation =
                            await deviceInformationUseCase.execute();

                        final username = await SaveLocal().getUserid();
                        final dispatchTargetId = deviceInformation
                                ?.idUsernamePairs
                                .where(
                                    (element) => element.username == username)
                                .toList() ??
                            [];

                        ref
                            .read(mobileClientAuthNotifierProvider.notifier)
                            .mobileClientAuthFunc(
                                MobileClientAuthParam(
                                    isiwebuserid:
                                        dispatchTargetId.first.username,
                                    dispatchTargetId:
                                        dispatchTargetId.first.identifier),
                                ref);
                      } else {
                        //todo changes the local data
                        debugPrint('biometric registered================>>');
                        SaveLocal().saveisBiometricEnabled(toggleValue);

                        if (toggleValue) {
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(
                              context, Routes.biometricChangeSuccessfulRoute,
                              arguments: (isBiometric)
                                  ? 'enableBio'
                                  : 'enableFingerprint');
                        } else {
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(
                              context, Routes.biometricChangeSuccessfulRoute,
                              arguments: (isBiometric)
                                  ? 'disableBio'
                                  : 'disableFingerprint');
                        }
                      }
                    }
                  }),
              const SizedBox(height: AppSize.s16),
            ],
          ),
        ),
      ],
    );
  }
}
