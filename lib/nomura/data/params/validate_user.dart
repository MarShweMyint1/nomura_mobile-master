import 'package:freezed_annotation/freezed_annotation.dart';
part 'validate_user.freezed.dart';

@freezed
class ValidateUserParams with _$ValidateUserParams {
  factory ValidateUserParams({
    required String userName,
  }) = _ValidateUserParams;
}
