import 'package:freezed_annotation/freezed_annotation.dart';
part 'mobile_client_auth_param.freezed.dart';
@freezed
class MobileClientAuthParam with _$MobileClientAuthParam {
  factory MobileClientAuthParam(
      {required String isiwebuserid,
      required String dispatchTargetId}) = _MobileClientAuthParam;
}
