import 'package:json_annotation/json_annotation.dart';
part 'legacy_login_model.g.dart';

@JsonSerializable()
class LegacyLoginModel {
  final String? transfarId;
  final String? code;
  final String? message;
  final String? mobile;
  final String? email;

  factory LegacyLoginModel.fromJson(Map<String, dynamic> json) =>
      _$LegacyLoginModelFromJson(json);

  LegacyLoginModel({
    this.transfarId,
    this.code,
    this.message,
    this.mobile,
    this.email,
  });

  Map<String, dynamic> toJson() => _$LegacyLoginModelToJson(this);
}
