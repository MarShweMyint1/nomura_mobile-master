// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pwd_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PwdParams {
  String get userName => throw _privateConstructorUsedError;
  String get pin => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PwdParamsCopyWith<PwdParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PwdParamsCopyWith<$Res> {
  factory $PwdParamsCopyWith(PwdParams value, $Res Function(PwdParams) then) =
      _$PwdParamsCopyWithImpl<$Res, PwdParams>;
  @useResult
  $Res call({String userName, String pin});
}

/// @nodoc
class _$PwdParamsCopyWithImpl<$Res, $Val extends PwdParams>
    implements $PwdParamsCopyWith<$Res> {
  _$PwdParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? pin = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PwdParamsCopyWith<$Res> implements $PwdParamsCopyWith<$Res> {
  factory _$$_PwdParamsCopyWith(
          _$_PwdParams value, $Res Function(_$_PwdParams) then) =
      __$$_PwdParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName, String pin});
}

/// @nodoc
class __$$_PwdParamsCopyWithImpl<$Res>
    extends _$PwdParamsCopyWithImpl<$Res, _$_PwdParams>
    implements _$$_PwdParamsCopyWith<$Res> {
  __$$_PwdParamsCopyWithImpl(
      _$_PwdParams _value, $Res Function(_$_PwdParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? pin = null,
  }) {
    return _then(_$_PwdParams(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PwdParams implements _PwdParams {
  _$_PwdParams({required this.userName, required this.pin});

  @override
  final String userName;
  @override
  final String pin;

  @override
  String toString() {
    return 'PwdParams(userName: $userName, pin: $pin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PwdParams &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.pin, pin) || other.pin == pin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, pin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PwdParamsCopyWith<_$_PwdParams> get copyWith =>
      __$$_PwdParamsCopyWithImpl<_$_PwdParams>(this, _$identity);
}

abstract class _PwdParams implements PwdParams {
  factory _PwdParams(
      {required final String userName,
      required final String pin}) = _$_PwdParams;

  @override
  String get userName;
  @override
  String get pin;
  @override
  @JsonKey(ignore: true)
  _$$_PwdParamsCopyWith<_$_PwdParams> get copyWith =>
      throw _privateConstructorUsedError;
}
