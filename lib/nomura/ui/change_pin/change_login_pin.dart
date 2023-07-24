import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/domain/usecases/cancel_user_interaction_operation_usecase.dart';
import 'package:nomura_mobile/nomura/domain/usecases/change_pin_authenticate_usecase.dart';
import 'package:nomura_mobile/nomura/domain/usecases/verify_pin_usecase.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/result/result_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/result/result_state.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/forgot/widgets/forgot_pin_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_button.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_pin.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils/collection_utils.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/constant_utils.dart';
import 'package:nomura_mobile/nomura/utils/enumeration.dart';
import 'package:nomura_mobile/nomura/utils/string_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

class ChangeLoginPinScreen extends ConsumerStatefulWidget {
  const ChangeLoginPinScreen({super.key});
  @override
  ConsumerState<ChangeLoginPinScreen> createState() => _ChangeLoginPinScreen();
}

class _ChangeLoginPinScreen extends ConsumerState<ChangeLoginPinScreen> {
  TextEditingController pinController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // SaveLocal().saveIsChangePin(false);
    initFunction();
    pinController.clear();
  }

  initFunction() async {
    String username = await SaveLocal().getUserid();
    SaveLocal().saveIsChangePin(true);
    SaveLocal().saveSelector(isIOS ? "F1D0#1001" : "F1D0#0001");
    ChangePinAuthenticateUsecase authenticateUseCase =
        GetIt.I<ChangePinAuthenticateUsecase>();
    await authenticateUseCase
        .execute(
            username: username,
            sessionProvider: null,
            operationType: OperationType.authentication,
            ref: ref,
            authType: AuthType.pinChange)
        .catchError((error) {
      debugPrint("AuthenticateUseCase Execute Error ===>> $error");
    });
    // SaveLocal().saveIsChangePin(false);
  }

  @override
  Widget build(BuildContext context) {
    // ref.listen<authz.PwdAuthzState>(authzNotifierProvider, (pre, next) async {
    //   if (next is authz.Loading) {
    //     loadingDialog(context);
    //   }
    //   if (next is authz.Data) {
    //     Navigator.pop(context);

    //     // ignore: use_build_context_synchronously
    //     Navigator.pushNamed(
    //       context,
    //       Routes.changePinRoute,
    //       arguments: pinController.text,
    //     );
    //   }
    // });

    ref.listen(resultNotifierProvider, (prev, next) {
      if (next is Loading) {
        loadingDialog(context);
      } else if (next is VerifyPINData) {
        Navigator.pushNamed(context, Routes.forgotPinSuccessRoute);
      }
    });

    return Scaffold(
      backgroundColor: ColorUtils.primary,
      appBar: nomuraActionAppbar(context, press: () async {
        CancelUserInteractionOperationUseCase
            cancelUserInteractionOperationUseCase =
            GetIt.I<CancelUserInteractionOperationUseCase>();
        cancelUserInteractionOperationUseCase.execute().whenComplete(() {
          debugPrint("CHANGE PIN Cancel >>>>>>>>");
          Navigator.pop(context);
        }).catchError((error) {});
      }),
      body: Container(
        margin: const EdgeInsets.all(AppMargin.m32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            titleText(StringUtils.wantToChangePin),
            const Spacer(),
            subtitleText(StringUtils.changePinStatus),
            const Spacer(),
            CustomPinWidget(
              pinController: pinController,
              keyboardType: TextInputType.number,
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
      persistentFooterButtons: [
        Container(
          padding: const EdgeInsets.all(AppPadding.p32),
          child: Column(
            children: [
              CustomButton(
                  btnText: StringUtils.confirm,
                  onTap: () async {
                    if (pinController.text.isNotEmpty) {
                      if (regExpNumberType(pinController.text.toString())) {
                        ref
                            .read(currentPinProvider.notifier)
                            .saveCurrentPin(pinController.text);

                        VerifyPinUseCase verifyPinUseCase =
                            GetIt.I<VerifyPinUseCase>();
                        verifyPinUseCase.execute(pinController.text);
                      } else {
                        okDialog(
                          context,
                          content: StringUtils.validPin,
                          onPressed: () => Navigator.pop(context),
                          isSuccess: false,
                        );
                      }
                    } else {
                      okDialog(
                        context,
                        content: StringUtils.pinEmpty,
                        onPressed: () => Navigator.pop(context),
                        isSuccess: false,
                      );
                    }
                  }),
              const SizedBox(height: AppSize.s32),
              const ForgotPinWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
