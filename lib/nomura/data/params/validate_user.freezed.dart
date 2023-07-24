// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validate_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ValidateUserParams {
  String get userName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValidateUserParamsCopyWith<ValidateUserParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidateUserParamsCopyWith<$Res> {
  factory $ValidateUserParamsCopyWith(
          ValidateUserParams value, $Res Function(ValidateUserParams) then) =
      _$ValidateUserParamsCopyWithImpl<$Res, ValidateUserParams>;
  @useResult
  $Res call({String userName});
}

/// @nodoc
class _$ValidateUserParamsCopyWithImpl<$Res, $Val extends ValidateUserParams>
    implements $ValidateUserParamsCopyWith<$Res> {
  _$ValidateUserParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ValidateUserParamsCopyWith<$Res>
    implements $ValidateUserParamsCopyWith<$Res> {
  factory _$$_ValidateUserParamsCopyWith(_$_ValidateUserParams value,
          $Res Function(_$_ValidateUserParams) then) =
      __$$_ValidateUserParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName});
}

/// @nodoc
class __$$_ValidateUserParamsCopyWithImpl<$Res>
    extends _$ValidateUserParamsCopyWithImpl<$Res, _$_ValidateUserParams>
    implements _$$_ValidateUserParamsCopyWith<$Res> {
  __$$_ValidateUserParamsCopyWithImpl(
      _$_ValidateUserParams _value, $Res Function(_$_ValidateUserParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
  }) {
    return _then(_$_ValidateUserParams(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ValidateUserParams implements _ValidateUserParams {
  _$_ValidateUserParams({required this.userName});

  @override
  final String userName;

  @override
  String toString() {
    return 'ValidateUserParams(userName: $userName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValidateUserParams &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ValidateUserParamsCopyWith<_$_ValidateUserParams> get copyWith =>
      __$$_ValidateUserParamsCopyWithImpl<_$_ValidateUserParams>(
          this, _$identity);
}

abstract class _ValidateUserParams implements ValidateUserParams {
  factory _ValidateUserParams({required final String userName}) =
      _$_ValidateUserParams;

  @override
  String get userName;
  @override
  @JsonKey(ignore: true)
  _$$_ValidateUserParamsCopyWith<_$_ValidateUserParams> get copyWith =>
      throw _privateConstructorUsedError;
}
