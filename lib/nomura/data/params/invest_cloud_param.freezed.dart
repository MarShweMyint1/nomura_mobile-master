// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invest_cloud_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InvestCloudParam {
  String get accessToken => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InvestCloudParamCopyWith<InvestCloudParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvestCloudParamCopyWith<$Res> {
  factory $InvestCloudParamCopyWith(
          InvestCloudParam value, $Res Function(InvestCloudParam) then) =
      _$InvestCloudParamCopyWithImpl<$Res, InvestCloudParam>;
  @useResult
  $Res call({String accessToken, String locale});
}

/// @nodoc
class _$InvestCloudParamCopyWithImpl<$Res, $Val extends InvestCloudParam>
    implements $InvestCloudParamCopyWith<$Res> {
  _$InvestCloudParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? locale = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InvestCloudParamCopyWith<$Res>
    implements $InvestCloudParamCopyWith<$Res> {
  factory _$$_InvestCloudParamCopyWith(
          _$_InvestCloudParam value, $Res Function(_$_InvestCloudParam) then) =
      __$$_InvestCloudParamCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String locale});
}

/// @nodoc
class __$$_InvestCloudParamCopyWithImpl<$Res>
    extends _$InvestCloudParamCopyWithImpl<$Res, _$_InvestCloudParam>
    implements _$$_InvestCloudParamCopyWith<$Res> {
  __$$_InvestCloudParamCopyWithImpl(
      _$_InvestCloudParam _value, $Res Function(_$_InvestCloudParam) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? locale = null,
  }) {
    return _then(_$_InvestCloudParam(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_InvestCloudParam implements _InvestCloudParam {
  _$_InvestCloudParam({required this.accessToken, required this.locale});

  @override
  final String accessToken;
  @override
  final String locale;

  @override
  String toString() {
    return 'InvestCloudParam(accessToken: $accessToken, locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvestCloudParam &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accessToken, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvestCloudParamCopyWith<_$_InvestCloudParam> get copyWith =>
      __$$_InvestCloudParamCopyWithImpl<_$_InvestCloudParam>(this, _$identity);
}

abstract class _InvestCloudParam implements InvestCloudParam {
  factory _InvestCloudParam(
      {required final String accessToken,
      required final String locale}) = _$_InvestCloudParam;

  @override
  String get accessToken;
  @override
  String get locale;
  @override
  @JsonKey(ignore: true)
  _$$_InvestCloudParamCopyWith<_$_InvestCloudParam> get copyWith =>
      throw _privateConstructorUsedError;
}
