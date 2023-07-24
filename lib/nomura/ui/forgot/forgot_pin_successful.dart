import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/successful_widget.dart';
import 'package:nomura_mobile/nomura/utils/string_utils.dart';

class SuccessFullyForgotPinScreen extends ConsumerWidget {
  const SuccessFullyForgotPinScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SuccessfulWidget(
        status: StringUtils.forgotPinSuccess,
        onClicked: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.initRoute,
            (_) => false,
          );
        });
  }
}
