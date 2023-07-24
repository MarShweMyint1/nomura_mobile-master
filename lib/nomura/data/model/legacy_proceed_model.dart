import 'package:json_annotation/json_annotation.dart';
import 'package:nomura_mobile/nomura/data/model/element_list_model.dart';
part 'legacy_proceed_model.g.dart';

@JsonSerializable()
class LegacyProceedModel {
  final String? name;
  final String? target;
  final String? label;
  final String? domain;
  final List<ElementList>? elements;

  LegacyProceedModel({
    this.name,
    this.target,
    this.label,
    this.domain,
    this.elements,
  });

  factory LegacyProceedModel.fromJson(Map<String, dynamic> json) =>
      _$LegacyProceedModelFromJson(json);
  Map<String, dynamic> toJson() => _$LegacyProceedModelToJson(this);
}
