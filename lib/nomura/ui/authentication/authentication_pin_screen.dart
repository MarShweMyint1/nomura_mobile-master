import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_button.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

class AuthenticationPinScreen extends ConsumerWidget {
  const AuthenticationPinScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TextEditingController pinController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorUtils.primary,
      appBar: nomuraAppbar(context),
      body: Container(
        margin: const EdgeInsets.all(AppMargin.m32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            titleText("Enter your login PIN for authentication"),
            const Spacer(),
            subtitleText("Please enter your PIN to confirm."),
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
              CustomButton(btnText: 'Continue', onTap: (){}),
              const SizedBox(height: AppSize.s32),
             
              // const SizedBox(height: AppSize.s32),
              // action ?? const SizedBox(),
            ],
          ),
        ),
      ],
    );
    // PinWidget(
    //   title: 'Are you sure to deregister this device?',
    //   subTitle:
    //       'If you proceed with deregistering this device, you will no longer have access to the app from this device. You will need to complete the registration process again if you want to access the app from this device. To continue, please enter your login PIN for verification.',
    //   onClicked: () async {
    //     var username = await SaveLocal().getUserid();
    //     debugPrint("DEREGISTER ====>>>> $username");
    //     var cookies = ref.watch(cookieProvider);
    //     SaveLocal().saveSelector('F1D0#0001');

    //     // VerifyPinUseCase verifyPinUseCase = GetIt.I<VerifyPinUseCase>();
    //     // verifyPinUseCase.execute(pinController.text);
    //     // DeregisterUseCase deregisterUseCase = GetIt.I<DeregisterUseCase>();
    //     // await deregisterUseCase
    //     //     .execute(
    //     //         username: username.toString(),
    //     //         authorizationProvider: authProvider,
    //     //         ref: ref
    //     //         // authenticators: authenticators,
    //     //         )
    //     //     .catchError((error) {
    //     //   debugPrint("Deregister ERROR :-( ====>>> $error");
    //     //   // _errorHandler.handle(error);
    //     // });
    //     // debugPrint("Deregistration Successed :-) ====>>>");
    //   },
    //   // Navigator.pushReplacementNamed(
    //   //     context, Routes.deregisterationSuccessRoute),
    //   // action: InkWell(
    //   //   onTap: () =>
    //   //       Navigator.pushReplacementNamed(context, Routes.forgotRoute),
    //   //   child: Text(
    //   //     'Forgot Pin?',
    //   //     style: getApplicationTheme().textTheme.displaySmall!.copyWith(
    //   //           decoration: TextDecoration.underline,
    //   //           color: Colors.white,
    //   //         ),
    //   //     textAlign: TextAlign.center,
    //   //   ),
    //   // ),
    //   // pinController: pinController,
    // );
  }
}
