import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/widgets/successful_widget.dart';

class LoginSuccess extends ConsumerWidget {
  final String token;
  const LoginSuccess({super.key, required this.token});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SuccessfulWidget(
      status: 'You are authenticated successfully!',
      onClicked: () {
        SaveLocal().saveAuthToken(token);
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.homeRoute,
          (route) => false,
          arguments: token,
        );
      },
    );
  }
}
