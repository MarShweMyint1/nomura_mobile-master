import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/params/select_authenticator_parameter.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/registration/registration_provider.dart';
import 'package:nomura_mobile/nomura/riverpod/registration/registration_state.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils.dart';

class FingerPrintScreen extends ConsumerWidget {
  const FingerPrintScreen({
    super.key,
    required this.parameter,
  });

  final SelectAuthenticatorParameter parameter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String username = ref.watch(usernameProvider);
    ref.listen(registrationNotifierProvider, (_, next) {
      SaveLocal().clearFingerprint();
      if (next is Loading) {
        loadingDialog(context);
      } else if (next is Error) {
        Navigator.pop(context);
      } else {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, Routes.successfulRegisterRoute);
      }
    });

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: ColorUtils.primary,
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p32),
              margin: const EdgeInsets.symmetric(
                horizontal: AppMargin.m32,
                vertical: AppMargin.m32,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    SaveLocal().isFingerprintSkip(true);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.successfulRegisterRoute,
                      (route) => false,
                    );
                  },
                  child: Text(
                    'Skip',
                    style: getApplicationTheme().textTheme.headlineSmall,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: AppMargin.m32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  titleText(StringUtils.addFingerprint),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      bodyText(
                        StringUtils.enableFingerPrint,
                      ),
                      CustomSwitch(
                        username: username,
                        parameter: parameter,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  subtitleText(
                    StringUtils.enableFingerprintText,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class CustomSwitch extends ConsumerWidget {
  final String username;
  final SelectAuthenticatorParameter parameter;
  const CustomSwitch({
    Key? key,
    required this.username,
    required this.parameter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool toggleValue = ref.watch(toggleValueProvider);
    double size = 30;
    double innerPadding = 3;
    return GestureDetector(
      onTap: () async {
        var authProvider = ref.watch(authorizationStorageProvider);
        SaveLocal().saveSelector(parameter.aaid);
        toggleValue =
            ref.read(toggleValueProvider.notifier).toggle(toggleValue);
        print('fingerprint aaid in fingerprint screen--->${parameter.aaid}');
        ref.read(registrationNotifierProvider.notifier).registration(
              username: parameter.username.toString(),
              authorizationProvider: authProvider,
              ref: ref,
              aaid: parameter.aaid,
            );
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
