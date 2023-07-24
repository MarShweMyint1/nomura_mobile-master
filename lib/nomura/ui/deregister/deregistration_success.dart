import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/successful_widget.dart';
import 'package:nomura_mobile/nomura/utils/string_utils.dart';

class SuccessFullyDegistrationScreen extends ConsumerWidget {
  const SuccessFullyDegistrationScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SuccessfulWidget(
        status: StringUtils.deregisterSuccess,
        onClicked: () {
          SaveLocal().clearAll();
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.initRoute, (_) => false);
        });
  }
}
