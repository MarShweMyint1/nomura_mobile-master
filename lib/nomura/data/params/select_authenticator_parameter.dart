// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';

class SelectAuthenticatorParameter {
  final String aaid;
  final OperationType? operationType;
  final String? username;

  SelectAuthenticatorParameter({
    required this.aaid,
    this.operationType,
    this.username,
  });
}
