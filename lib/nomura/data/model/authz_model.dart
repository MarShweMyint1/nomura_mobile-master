// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';

part 'authz_model.g.dart';

@JsonSerializable()
class AuthzModel {
  final String? code;
  final String? verifier;
  AuthzModel({
    this.code,
    this.verifier
  });
  factory AuthzModel.fromJson(Map<String, dynamic> json) =>
      _$AuthzModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthzModelToJson(this);
}
