// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TokenParam {
// required String clientId,
// required String clientSecret,
// required String redirectUrl,
// required String grantType,
  String get code => throw _privateConstructorUsedError;
  String get codeVerifier => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TokenParamCopyWith<TokenParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenParamCopyWith<$Res> {
  factory $TokenParamCopyWith(
          TokenParam value, $Res Function(TokenParam) then) =
      _$TokenParamCopyWithImpl<$Res, TokenParam>;
  @useResult
  $Res call({String code, String codeVerifier});
}

/// @nodoc
class _$TokenParamCopyWithImpl<$Res, $Val extends TokenParam>
    implements $TokenParamCopyWith<$Res> {
  _$TokenParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? codeVerifier = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      codeVerifier: null == codeVerifier
          ? _value.codeVerifier
          : codeVerifier // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TokenParamCopyWith<$Res>
    implements $TokenParamCopyWith<$Res> {
  factory _$$_TokenParamCopyWith(
          _$_TokenParam value, $Res Function(_$_TokenParam) then) =
      __$$_TokenParamCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String codeVerifier});
}

/// @nodoc
class __$$_TokenParamCopyWithImpl<$Res>
    extends _$TokenParamCopyWithImpl<$Res, _$_TokenParam>
    implements _$$_TokenParamCopyWith<$Res> {
  __$$_TokenParamCopyWithImpl(
      _$_TokenParam _value, $Res Function(_$_TokenParam) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? codeVerifier = null,
  }) {
    return _then(_$_TokenParam(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      codeVerifier: null == codeVerifier
          ? _value.codeVerifier
          : codeVerifier // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TokenParam implements _TokenParam {
  _$_TokenParam({required this.code, required this.codeVerifier});

// required String clientId,
// required String clientSecret,
// required String redirectUrl,
// required String grantType,
  @override
  final String code;
  @override
  final String codeVerifier;

  @override
  String toString() {
    return 'TokenParam(code: $code, codeVerifier: $codeVerifier)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenParam &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.codeVerifier, codeVerifier) ||
                other.codeVerifier == codeVerifier));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, codeVerifier);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenParamCopyWith<_$_TokenParam> get copyWith =>
      __$$_TokenParamCopyWithImpl<_$_TokenParam>(this, _$identity);
}

abstract class _TokenParam implements TokenParam {
  factory _TokenParam(
      {required final String code,
      required final String codeVerifier}) = _$_TokenParam;

  @override // required String clientId,
// required String clientSecret,
// required String redirectUrl,
// required String grantType,
  String get code;
  @override
  String get codeVerifier;
  @override
  @JsonKey(ignore: true)
  _$$_TokenParamCopyWith<_$_TokenParam> get copyWith =>
      throw _privateConstructorUsedError;
}
