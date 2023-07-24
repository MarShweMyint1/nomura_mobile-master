import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nomura_mobile/nomura/data/params/validate_user.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/legacy_login/legacy_login_provider.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_button.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils.dart';
import 'package:nomura_mobile/nomura/utils/collection_utils.dart';

class UserNameScreen extends ConsumerWidget {
  const UserNameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController usernameCnt = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorUtils.primary,
      appBar: nomuraTextAppbar(),
      body: Container(
        margin: const EdgeInsets.all(AppMargin.m32),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              titleText(StringUtils.registerNewDevice),
              const Spacer(),
              TextFormField(
                controller: usernameCnt,
                autofocus: false,
                decoration: InputDecoration(
                  labelStyle: getApplicationTheme()
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                  hintText: StringUtils.enterUsername,
                  hintStyle: getApplicationTheme()
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 12),
                  errorStyle: getApplicationTheme()
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.yellow),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const Spacer(),
              const Spacer(),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                btnText: StringUtils.register,
                onTap: () {
                  if (usernameCnt.text.trim().toString().isEmpty) {
                    okDialog(
                      context,
                      content: StringUtils.userEmpty,
                      onPressed: () => Navigator.pop(context),
                      isSuccess: false,
                    );
                  } else {
                    if (regExpStringType(usernameCnt.text.trim().toString())) {
                      _onClickRegister(
                        context,
                        username: usernameCnt.text.trim(),
                        ref: ref,
                      );
                    } else {
                      okDialog(
                        context,
                        content: StringUtils.usernameValidation,
                        onPressed: () => Navigator.pop(context),
                        isSuccess: false,
                      );
                    }
                  }
                },
              ),
              const SizedBox(height: AppSize.s28),
              overAllText(
                StringUtils.alreadyAccount,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSize.s12),
              GestureDetector(
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.initRoute,
                  (Route<dynamic> route) => false,
                ),
                child: Text(
                  StringUtils.signInNow,
                  style: getApplicationTheme().textTheme.bodyLarge!.copyWith(
                        decoration: TextDecoration.underline,
                        height: 1.5,
                        fontSize: 12,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onClickRegister(
    BuildContext context, {
    required String username,
    required WidgetRef ref,
  }) async {
    if (username.isNotEmpty) {
      if (await InternetConnectionChecker().hasConnection) {
        ref.read(usernameProvider.notifier).saveUserName(username);
        SaveLocal().saveUserid(username);
        SaveLocal().saveIsForgetPin(false);
        ref.read(legacyLoginNotifierProvider.notifier).legacyLoginFunc(
              ValidateUserParams(
                userName: username,
              ),
            );
      } else {
        // ignore: use_build_context_synchronously
        okDialog(
          context,
          content: StringUtils.noInternet,
          onPressed: () => Navigator.pop(context),
          isSuccess: false,
        );
      }
    } else {
      okDialog(context,
          content: StringUtils.userEmpty,
          onPressed: () => Navigator.pop(context),
          isSuccess: false);
    }
  }
}
