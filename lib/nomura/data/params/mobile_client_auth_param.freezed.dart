// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mobile_client_auth_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MobileClientAuthParam {
  String get isiwebuserid => throw _privateConstructorUsedError;
  String get dispatchTargetId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MobileClientAuthParamCopyWith<MobileClientAuthParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MobileClientAuthParamCopyWith<$Res> {
  factory $MobileClientAuthParamCopyWith(MobileClientAuthParam value,
          $Res Function(MobileClientAuthParam) then) =
      _$MobileClientAuthParamCopyWithImpl<$Res, MobileClientAuthParam>;
  @useResult
  $Res call({String isiwebuserid, String dispatchTargetId});
}

/// @nodoc
class _$MobileClientAuthParamCopyWithImpl<$Res,
        $Val extends MobileClientAuthParam>
    implements $MobileClientAuthParamCopyWith<$Res> {
  _$MobileClientAuthParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isiwebuserid = null,
    Object? dispatchTargetId = null,
  }) {
    return _then(_value.copyWith(
      isiwebuserid: null == isiwebuserid
          ? _value.isiwebuserid
          : isiwebuserid // ignore: cast_nullable_to_non_nullable
              as String,
      dispatchTargetId: null == dispatchTargetId
          ? _value.dispatchTargetId
          : dispatchTargetId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MobileClientAuthParamCopyWith<$Res>
    implements $MobileClientAuthParamCopyWith<$Res> {
  factory _$$_MobileClientAuthParamCopyWith(_$_MobileClientAuthParam value,
          $Res Function(_$_MobileClientAuthParam) then) =
      __$$_MobileClientAuthParamCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String isiwebuserid, String dispatchTargetId});
}

/// @nodoc
class __$$_MobileClientAuthParamCopyWithImpl<$Res>
    extends _$MobileClientAuthParamCopyWithImpl<$Res, _$_MobileClientAuthParam>
    implements _$$_MobileClientAuthParamCopyWith<$Res> {
  __$$_MobileClientAuthParamCopyWithImpl(_$_MobileClientAuthParam _value,
      $Res Function(_$_MobileClientAuthParam) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isiwebuserid = null,
    Object? dispatchTargetId = null,
  }) {
    return _then(_$_MobileClientAuthParam(
      isiwebuserid: null == isiwebuserid
          ? _value.isiwebuserid
          : isiwebuserid // ignore: cast_nullable_to_non_nullable
              as String,
      dispatchTargetId: null == dispatchTargetId
          ? _value.dispatchTargetId
          : dispatchTargetId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MobileClientAuthParam implements _MobileClientAuthParam {
  _$_MobileClientAuthParam(
      {required this.isiwebuserid, required this.dispatchTargetId});

  @override
  final String isiwebuserid;
  @override
  final String dispatchTargetId;

  @override
  String toString() {
    return 'MobileClientAuthParam(isiwebuserid: $isiwebuserid, dispatchTargetId: $dispatchTargetId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MobileClientAuthParam &&
            (identical(other.isiwebuserid, isiwebuserid) ||
                other.isiwebuserid == isiwebuserid) &&
            (identical(other.dispatchTargetId, dispatchTargetId) ||
                other.dispatchTargetId == dispatchTargetId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isiwebuserid, dispatchTargetId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MobileClientAuthParamCopyWith<_$_MobileClientAuthParam> get copyWith =>
      __$$_MobileClientAuthParamCopyWithImpl<_$_MobileClientAuthParam>(
          this, _$identity);
}

abstract class _MobileClientAuthParam implements MobileClientAuthParam {
  factory _MobileClientAuthParam(
      {required final String isiwebuserid,
      required final String dispatchTargetId}) = _$_MobileClientAuthParam;

  @override
  String get isiwebuserid;
  @override
  String get dispatchTargetId;
  @override
  @JsonKey(ignore: true)
  _$$_MobileClientAuthParamCopyWith<_$_MobileClientAuthParam> get copyWith =>
      throw _privateConstructorUsedError;
}
