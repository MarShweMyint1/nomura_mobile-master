import 'package:freezed_annotation/freezed_annotation.dart';
part 'pwd_params.freezed.dart';

@freezed
class PwdParams with _$PwdParams {
  factory PwdParams({
    required String userName,
    required String pin,
  }) = _PwdParams;
}
