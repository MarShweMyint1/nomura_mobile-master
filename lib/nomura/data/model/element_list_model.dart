import 'package:json_annotation/json_annotation.dart';
part 'element_list_model.g.dart';

@JsonSerializable()
class ElementList {
  final String? name;
  final String? type;
  final String? optional;
  final String? label;
  @JsonKey(name: 'max-length')
  final String? maxlength;
  final String? value;

  ElementList({
    this.name,
    this.type,
    this.optional,
    this.label,
    this.maxlength,
    this.value
  });
  factory ElementList.fromJson(Map<String, dynamic> json) =>
      _$ElementListFromJson(json);
  Map<String, dynamic> toJson() => _$ElementListToJson(this);
}
