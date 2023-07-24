// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nomura_mobile/nomura/app_state/app_bloc.dart';
import 'package:nomura_mobile/nomura/app_state/app_event.dart';
import 'package:nomura_mobile/nomura/app_state/app_state.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/utils.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;

  const AppScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldContent(
      body: body,
    );
  }
}

class AppScaffoldContent extends StatelessWidget {
  final Widget body;

  const AppScaffoldContent({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AppBloc>();
    return BlocConsumer<AppBloc, AppState>(
      listenWhen: (oldState, newState) =>
          _isCurrent(context) && newState.isListenable,
      buildWhen: (oldState, newState) =>
          _isCurrent(context) && !newState.isListenable,
      listener: (ctx, state) async {
        if (state is VerifyFingerPrintState) {
          bloc.add(UserFingerPrintEvent());
        } else if (state is VerifyBiometricState) {
          // bloc.add(UserBiometricEvent(
          //   title: 'Biometric',
          //   description: 'Desc',
          //   cancelButtonText: 'Cancel',
          // ));
        } else if (state is VerifyPinState &&
            currentScreen(context) != Routes.confirmPinRoute) {
          bloc.add(UserPinEvent(
            protectionStatus: state.protectionStatus,
            lastRecoverableError: state.lastRecoverableError,
          ));
        }
      },
      builder: (ctx, state) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            backgroundColor: ColorUtils.primary,
            resizeToAvoidBottomInset: false,
            body: body,
          ),
        );
      },
    );
  }

  bool _isCurrent(BuildContext context) {
    return ModalRoute.of(context)?.isCurrent ?? false;
  }

  String? currentScreen(BuildContext context) {
    return ModalRoute.of(context)?.settings.name;
  }
}
