// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';
import 'package:nomura_mobile/nomura/errors/error_message_types.dart';
import 'package:nomura_mobile/nomura/app_state/operation_result_type.dart';

class ResultParameter {
  final OperationResultType type;
  final BusinessErrorType? errorType;
  final String? description;
  final FidoErrorCodeType? fidoErrorCodeType;
  final OperationType? operationType;
  ResultParameter.success(
      {this.errorType, this.description, this.fidoErrorCodeType,this.operationType})
      : type = OperationResultType.success;

  ResultParameter.failure(
      {this.errorType, this.description, this.fidoErrorCodeType,this.operationType})
      : type = OperationResultType.failure;
}
