import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/domain/operation/operation_type.dart';
import 'package:nomura_mobile/nomura/riverpod/result/result_state.dart';
import 'package:nomura_mobile/nomura/utils/constant_utils.dart';
part 'result_notifier.dart';

final resultNotifierProvider =
    StateNotifierProvider.autoDispose<ResultNotifier, ResultState>(
  (ref) => ResultNotifier(),
);
