import 'package:freezed_annotation/freezed_annotation.dart';
part 'authz_param.freezed.dart';

@freezed
class AuthzParam with _$AuthzParam {
  factory AuthzParam({
    required String clientId,
    required String redirectUri,
    required String responseType,
    required String scope,
    required String state,
    required String codeChallenge,
    required String codeChallengeMethod,
  }) = _AuthzParam;
}
