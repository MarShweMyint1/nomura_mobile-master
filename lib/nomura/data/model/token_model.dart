import 'package:json_annotation/json_annotation.dart';
part 'token_model.g.dart';

@JsonSerializable()
class TokenModel {
  String? access_token;
  String? id_token;
  String? token_type;
  int? expires_in;
  TokenModel(
      this.access_token, this.id_token, this.token_type, this.expires_in);
  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}


    // "name": "AuthErrorDialog",
    // "target": "https://nomura-mfa-dev.southeastasia.cloudapp.azure.com/inband/oidc/token",
    // "label": "Error",
    // "domain": "Inband_Realm",