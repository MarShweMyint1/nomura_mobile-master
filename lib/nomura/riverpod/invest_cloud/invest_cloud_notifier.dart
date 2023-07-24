import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/params/invest_cloud_param.dart';
import 'package:nomura_mobile/nomura/domain/usecases/invest_cloud_usecase.dart';
import 'package:nomura_mobile/nomura/riverpod/invest_cloud/invest_cloud_state.dart';

class InvestCloudNotifier extends StateNotifier<InvestCloudState> {
  final InvestCloudUsecase _investCloudUsecase;
  InvestCloudNotifier(
      {required InvestCloudUsecase investCloudUsecase,
      InvestCloudState? initState})
      : _investCloudUsecase = investCloudUsecase,
        super(
          initState ?? const InvestCloudState.initial(),
        );
  void reset() => state = const InvestCloudState.initial();

  Future<void> investCloudFun(InvestCloudParam params) async {
    state = const InvestCloudState.loading();
    final result = await _investCloudUsecase.investCloudUsecase(params);
    debugPrint('invest cloud result ===============> $result');
    result.fold(
      (failure) {
        state = InvestCloudState.error(
          message: failure.toString(),
        );
      },
      (success) => state = InvestCloudState.data(data: success),
    );
  }
}
