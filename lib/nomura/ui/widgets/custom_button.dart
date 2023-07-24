import 'package:flutter/material.dart';
import 'package:nomura_mobile/nomura/utils/theme_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.btnText,
      required this.onTap,
      this.widget});
  final String btnText;
  final Function() onTap;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
      ),
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           (widget==null)?const Icon(Icons.login_rounded,color: Colors.black,):widget!,
          //  Visibility(
          //   visible: widget==null,
          //   child: const Icon(Icons.login_rounded),
          //  )
            const SizedBox(width: AppSize.s16),
            Text(
              btnText,
              style: getApplicationTheme().textTheme.headlineMedium,
            
            ),
          ],
        ),
      ),
    );
  }
}
