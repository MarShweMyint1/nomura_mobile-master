import 'package:json_annotation/json_annotation.dart';
part 'invest_cloud_model.g.dart';

@JsonSerializable()
class InvestCloud {
  final String? nomuraHomePageLink;

  InvestCloud(this.nomuraHomePageLink);

  factory InvestCloud.fromJson(Map<String, dynamic> json) =>
      _$InvestCloudFromJson(json);

  Map<String, dynamic> toJson() => _$InvestCloudToJson(this);
}
