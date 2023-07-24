import 'package:freezed_annotation/freezed_annotation.dart';
part 'token_param.freezed.dart';

@freezed
class TokenParam with _$TokenParam {
  factory TokenParam(
      {
      // required String clientId,
      // required String clientSecret,
      // required String redirectUrl,
      // required String grantType,
      required String code,
      required String codeVerifier}) = _TokenParam;
}
