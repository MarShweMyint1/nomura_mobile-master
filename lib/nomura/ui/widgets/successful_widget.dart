import 'package:flutter/material.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/custom_button.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

class SuccessfulWidget extends StatelessWidget {
  const SuccessfulWidget({
    Key? key,
    required this.status,
    required this.onClicked,
  }) : super(key: key);
  final String status;
  final Function() onClicked;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: ColorUtils.primary,
        appBar: nomuraTextAppbar(),
        body: Container(
          margin: const EdgeInsets.all(AppMargin.m16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(child: SizedBox()),
              Center(
                child: Icon(
                  Icons.check_circle_outline,
                  color: ColorUtils.white,
                  size: AppSize.s200,
                ),
              ),
              const SizedBox(height: AppSize.s16),
              titleText(status, textAlign: TextAlign.center),
              const Spacer(),
            ],
          ),
        ),
        persistentFooterButtons: [
          Container(
            padding: const EdgeInsets.all(AppPadding.p32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  btnText: "Continue",
                  onTap: onClicked,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
