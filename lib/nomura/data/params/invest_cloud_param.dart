import 'package:freezed_annotation/freezed_annotation.dart';
part 'invest_cloud_param.freezed.dart';

@freezed
class InvestCloudParam with _$InvestCloudParam {
  factory InvestCloudParam({
    required String accessToken,
    required String locale,
  }) = _InvestCloudParam;
}
