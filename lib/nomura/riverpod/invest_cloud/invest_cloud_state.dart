import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nomura_mobile/nomura/data/model/invest_cloud_model.dart';

part 'invest_cloud_state.freezed.dart';

extension Getters on InvestCloudState {
  bool get isLoading => this is Loading;
}

@freezed
class InvestCloudState with _$InvestCloudState {
  const factory InvestCloudState.data({required InvestCloud data}) = Data;
  const factory InvestCloudState.initial() = Initial;
  const factory InvestCloudState.loading() = Loading;

  const factory InvestCloudState.error({String? message}) = Error;
}
