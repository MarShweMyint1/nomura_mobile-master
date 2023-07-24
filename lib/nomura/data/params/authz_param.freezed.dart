// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authz_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthzParam {
  String get clientId => throw _privateConstructorUsedError;
  String get redirectUri => throw _privateConstructorUsedError;
  String get responseType => throw _privateConstructorUsedError;
  String get scope => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get codeChallenge => throw _privateConstructorUsedError;
  String get codeChallengeMethod => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthzParamCopyWith<AuthzParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthzParamCopyWith<$Res> {
  factory $AuthzParamCopyWith(
          AuthzParam value, $Res Function(AuthzParam) then) =
      _$AuthzParamCopyWithImpl<$Res, AuthzParam>;
  @useResult
  $Res call(
      {String clientId,
      String redirectUri,
      String responseType,
      String scope,
      String state,
      String codeChallenge,
      String codeChallengeMethod});
}

/// @nodoc
class _$AuthzParamCopyWithImpl<$Res, $Val extends AuthzParam>
    implements $AuthzParamCopyWith<$Res> {
  _$AuthzParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? redirectUri = null,
    Object? responseType = null,
    Object? scope = null,
    Object? state = null,
    Object? codeChallenge = null,
    Object? codeChallengeMethod = null,
  }) {
    return _then(_value.copyWith(
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      redirectUri: null == redirectUri
          ? _value.redirectUri
          : redirectUri // ignore: cast_nullable_to_non_nullable
              as String,
      responseType: null == responseType
          ? _value.responseType
          : responseType // ignore: cast_nullable_to_non_nullable
              as String,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      codeChallenge: null == codeChallenge
          ? _value.codeChallenge
          : codeChallenge // ignore: cast_nullable_to_non_nullable
              as String,
      codeChallengeMethod: null == codeChallengeMethod
          ? _value.codeChallengeMethod
          : codeChallengeMethod // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthzParamCopyWith<$Res>
    implements $AuthzParamCopyWith<$Res> {
  factory _$$_AuthzParamCopyWith(
          _$_AuthzParam value, $Res Function(_$_AuthzParam) then) =
      __$$_AuthzParamCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String clientId,
      String redirectUri,
      String responseType,
      String scope,
      String state,
      String codeChallenge,
      String codeChallengeMethod});
}

/// @nodoc
class __$$_AuthzParamCopyWithImpl<$Res>
    extends _$AuthzParamCopyWithImpl<$Res, _$_AuthzParam>
    implements _$$_AuthzParamCopyWith<$Res> {
  __$$_AuthzParamCopyWithImpl(
      _$_AuthzParam _value, $Res Function(_$_AuthzParam) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = null,
    Object? redirectUri = null,
    Object? responseType = null,
    Object? scope = null,
    Object? state = null,
    Object? codeChallenge = null,
    Object? codeChallengeMethod = null,
  }) {
    return _then(_$_AuthzParam(
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      redirectUri: null == redirectUri
          ? _value.redirectUri
          : redirectUri // ignore: cast_nullable_to_non_nullable
              as String,
      responseType: null == responseType
          ? _value.responseType
          : responseType // ignore: cast_nullable_to_non_nullable
              as String,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      codeChallenge: null == codeChallenge
          ? _value.codeChallenge
          : codeChallenge // ignore: cast_nullable_to_non_nullable
              as String,
      codeChallengeMethod: null == codeChallengeMethod
          ? _value.codeChallengeMethod
          : codeChallengeMethod // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthzParam implements _AuthzParam {
  _$_AuthzParam(
      {required this.clientId,
      required this.redirectUri,
      required this.responseType,
      required this.scope,
      required this.state,
      required this.codeChallenge,
      required this.codeChallengeMethod});

  @override
  final String clientId;
  @override
  final String redirectUri;
  @override
  final String responseType;
  @override
  final String scope;
  @override
  final String state;
  @override
  final String codeChallenge;
  @override
  final String codeChallengeMethod;

  @override
  String toString() {
    return 'AuthzParam(clientId: $clientId, redirectUri: $redirectUri, responseType: $responseType, scope: $scope, state: $state, codeChallenge: $codeChallenge, codeChallengeMethod: $codeChallengeMethod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthzParam &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.redirectUri, redirectUri) ||
                other.redirectUri == redirectUri) &&
            (identical(other.responseType, responseType) ||
                other.responseType == responseType) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.codeChallenge, codeChallenge) ||
                other.codeChallenge == codeChallenge) &&
            (identical(other.codeChallengeMethod, codeChallengeMethod) ||
                other.codeChallengeMethod == codeChallengeMethod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, clientId, redirectUri,
      responseType, scope, state, codeChallenge, codeChallengeMethod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthzParamCopyWith<_$_AuthzParam> get copyWith =>
      __$$_AuthzParamCopyWithImpl<_$_AuthzParam>(this, _$identity);
}

abstract class _AuthzParam implements AuthzParam {
  factory _AuthzParam(
      {required final String clientId,
      required final String redirectUri,
      required final String responseType,
      required final String scope,
      required final String state,
      required final String codeChallenge,
      required final String codeChallengeMethod}) = _$_AuthzParam;

  @override
  String get clientId;
  @override
  String get redirectUri;
  @override
  String get responseType;
  @override
  String get scope;
  @override
  String get state;
  @override
  String get codeChallenge;
  @override
  String get codeChallengeMethod;
  @override
  @JsonKey(ignore: true)
  _$$_AuthzParamCopyWith<_$_AuthzParam> get copyWith =>
      throw _privateConstructorUsedError;
}
