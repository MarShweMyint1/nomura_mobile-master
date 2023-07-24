// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_sms.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubmitSMSParams {
  String get userName => throw _privateConstructorUsedError;
  String get otpCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubmitSMSParamsCopyWith<SubmitSMSParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitSMSParamsCopyWith<$Res> {
  factory $SubmitSMSParamsCopyWith(
          SubmitSMSParams value, $Res Function(SubmitSMSParams) then) =
      _$SubmitSMSParamsCopyWithImpl<$Res, SubmitSMSParams>;
  @useResult
  $Res call({String userName, String otpCode});
}

/// @nodoc
class _$SubmitSMSParamsCopyWithImpl<$Res, $Val extends SubmitSMSParams>
    implements $SubmitSMSParamsCopyWith<$Res> {
  _$SubmitSMSParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? otpCode = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      otpCode: null == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubmitSMSParamsCopyWith<$Res>
    implements $SubmitSMSParamsCopyWith<$Res> {
  factory _$$_SubmitSMSParamsCopyWith(
          _$_SubmitSMSParams value, $Res Function(_$_SubmitSMSParams) then) =
      __$$_SubmitSMSParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName, String otpCode});
}

/// @nodoc
class __$$_SubmitSMSParamsCopyWithImpl<$Res>
    extends _$SubmitSMSParamsCopyWithImpl<$Res, _$_SubmitSMSParams>
    implements _$$_SubmitSMSParamsCopyWith<$Res> {
  __$$_SubmitSMSParamsCopyWithImpl(
      _$_SubmitSMSParams _value, $Res Function(_$_SubmitSMSParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? otpCode = null,
  }) {
    return _then(_$_SubmitSMSParams(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      otpCode: null == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SubmitSMSParams implements _SubmitSMSParams {
  _$_SubmitSMSParams({required this.userName, required this.otpCode});

  @override
  final String userName;
  @override
  final String otpCode;

  @override
  String toString() {
    return 'SubmitSMSParams(userName: $userName, otpCode: $otpCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitSMSParams &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.otpCode, otpCode) || other.otpCode == otpCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, otpCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitSMSParamsCopyWith<_$_SubmitSMSParams> get copyWith =>
      __$$_SubmitSMSParamsCopyWithImpl<_$_SubmitSMSParams>(this, _$identity);
}

abstract class _SubmitSMSParams implements SubmitSMSParams {
  factory _SubmitSMSParams(
      {required final String userName,
      required final String otpCode}) = _$_SubmitSMSParams;

  @override
  String get userName;
  @override
  String get otpCode;
  @override
  @JsonKey(ignore: true)
  _$$_SubmitSMSParamsCopyWith<_$_SubmitSMSParams> get copyWith =>
      throw _privateConstructorUsedError;
}
