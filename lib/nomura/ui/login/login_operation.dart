import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/domain/operation/login_init_client.dart';
import 'package:nomura_mobile/nomura/utils/enumeration.dart';

loginOperation(List dispatchTargets, AuthType authType, WidgetRef ref,
        BuildContext context) =>
    loginInitializeMobileAuthenticationClient(
      dispatchTargets: dispatchTargets,
      authType: authType,
      ref: ref,
      context: context,
    );
