// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_pin_authorize_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResetPinAuthorizeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ResetPinAuthorizeModel data) data,
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(LegacyLoginModel data) unauthorize,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ResetPinAuthorizeModel data)? data,
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(LegacyLoginModel data)? unauthorize,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ResetPinAuthorizeModel data)? data,
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(LegacyLoginModel data)? unauthorize,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data value) data,
    required TResult Function(Loading value) loading,
    required TResult Function(Initial value) initial,
    required TResult Function(Unauthorize value) unauthorize,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Data value)? data,
    TResult? Function(Loading value)? loading,
    TResult? Function(Initial value)? initial,
    TResult? Function(Unauthorize value)? unauthorize,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data value)? data,
    TResult Function(Loading value)? loading,
    TResult Function(Initial value)? initial,
    TResult Function(Unauthorize value)? unauthorize,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPinAuthorizeStateCopyWith<$Res> {
  factory $ResetPinAuthorizeStateCopyWith(ResetPinAuthorizeState value,
          $Res Function(ResetPinAuthorizeState) then) =
      _$ResetPinAuthorizeStateCopyWithImpl<$Res, ResetPinAuthorizeState>;
}

/// @nodoc
class _$ResetPinAuthorizeStateCopyWithImpl<$Res,
        $Val extends ResetPinAuthorizeState>
    implements $ResetPinAuthorizeStateCopyWith<$Res> {
  _$ResetPinAuthorizeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DataCopyWith<$Res> {
  factory _$$DataCopyWith(_$Data value, $Res Function(_$Data) then) =
      __$$DataCopyWithImpl<$Res>;
  @useResult
  $Res call({ResetPinAuthorizeModel data});
}

/// @nodoc
class __$$DataCopyWithImpl<$Res>
    extends _$ResetPinAuthorizeStateCopyWithImpl<$Res, _$Data>
    implements _$$DataCopyWith<$Res> {
  __$$DataCopyWithImpl(_$Data _value, $Res Function(_$Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$Data(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ResetPinAuthorizeModel,
    ));
  }
}

/// @nodoc

class _$Data implements Data {
  const _$Data({required this.data});

  @override
  final ResetPinAuthorizeModel data;

  @override
  String toString() {
    return 'ResetPinAuthorizeState.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Data &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataCopyWith<_$Data> get copyWith =>
      __$$DataCopyWithImpl<_$Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ResetPinAuthorizeModel data) data,
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(LegacyLoginModel data) unauthorize,
    required TResult Function(String error) error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ResetPinAuthorizeModel data)? data,
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(LegacyLoginModel data)? unauthorize,
    TResult? Function(String error)? error,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ResetPinAuthorizeModel data)? data,
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(LegacyLoginModel data)? unauthorize,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data value) data,
    required TResult Function(Loading value) loading,
    required TResult Function(Initial value) initial,
    required TResult Function(Unauthorize value) unauthorize,
    required TResult Function(Error value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Data value)? data,
    TResult? Function(Loading value)? loading,
    TResult? Function(Initial value)? initial,
    TResult? Function(Unauthorize value)? unauthorize,
    TResult? Function(Error value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data value)? data,
    TResult Function(Loading value)? loading,
    TResult Function(Initial value)? initial,
    TResult Function(Unauthorize value)? unauthorize,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class Data implements ResetPinAuthorizeState {
  const factory Data({required final ResetPinAuthorizeModel data}) = _$Data;

  ResetPinAuthorizeModel get data;
  @JsonKey(ignore: true)
  _$$DataCopyWith<_$Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$ResetPinAuthorizeStateCopyWithImpl<$Res, _$Loading>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'ResetPinAuthorizeState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ResetPinAuthorizeModel data) data,
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(LegacyLoginModel data) unauthorize,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ResetPinAuthorizeModel data)? data,
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(LegacyLoginModel data)? unauthorize,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ResetPinAuthorizeModel data)? data,
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(LegacyLoginModel data)? unauthorize,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data value) data,
    required TResult Function(Loading value) loading,
    required TResult Function(Initial value) initial,
    required TResult Function(Unauthorize value) unauthorize,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Data value)? data,
    TResult? Function(Loading value)? loading,
    TResult? Function(Initial value)? initial,
    TResult? Function(Unauthorize value)? unauthorize,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data value)? data,
    TResult Function(Loading value)? loading,
    TResult Function(Initial value)? initial,
    TResult Function(Unauthorize value)? unauthorize,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ResetPinAuthorizeState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$ResetPinAuthorizeStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'ResetPinAuthorizeState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ResetPinAuthorizeModel data) data,
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(LegacyLoginModel data) unauthorize,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ResetPinAuthorizeModel data)? data,
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(LegacyLoginModel data)? unauthorize,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ResetPinAuthorizeModel data)? data,
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(LegacyLoginModel data)? unauthorize,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data value) data,
    required TResult Function(Loading value) loading,
    required TResult Function(Initial value) initial,
    required TResult Function(Unauthorize value) unauthorize,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Data value)? data,
    TResult? Function(Loading value)? loading,
    TResult? Function(Initial value)? initial,
    TResult? Function(Unauthorize value)? unauthorize,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data value)? data,
    TResult Function(Loading value)? loading,
    TResult Function(Initial value)? initial,
    TResult Function(Unauthorize value)? unauthorize,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ResetPinAuthorizeState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$UnauthorizeCopyWith<$Res> {
  factory _$$UnauthorizeCopyWith(
          _$Unauthorize value, $Res Function(_$Unauthorize) then) =
      __$$UnauthorizeCopyWithImpl<$Res>;
  @useResult
  $Res call({LegacyLoginModel data});
}

/// @nodoc
class __$$UnauthorizeCopyWithImpl<$Res>
    extends _$ResetPinAuthorizeStateCopyWithImpl<$Res, _$Unauthorize>
    implements _$$UnauthorizeCopyWith<$Res> {
  __$$UnauthorizeCopyWithImpl(
      _$Unauthorize _value, $Res Function(_$Unauthorize) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$Unauthorize(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LegacyLoginModel,
    ));
  }
}

/// @nodoc

class _$Unauthorize implements Unauthorize {
  const _$Unauthorize({required this.data});

  @override
  final LegacyLoginModel data;

  @override
  String toString() {
    return 'ResetPinAuthorizeState.unauthorize(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Unauthorize &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizeCopyWith<_$Unauthorize> get copyWith =>
      __$$UnauthorizeCopyWithImpl<_$Unauthorize>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ResetPinAuthorizeModel data) data,
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(LegacyLoginModel data) unauthorize,
    required TResult Function(String error) error,
  }) {
    return unauthorize(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ResetPinAuthorizeModel data)? data,
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(LegacyLoginModel data)? unauthorize,
    TResult? Function(String error)? error,
  }) {
    return unauthorize?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ResetPinAuthorizeModel data)? data,
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(LegacyLoginModel data)? unauthorize,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (unauthorize != null) {
      return unauthorize(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data value) data,
    required TResult Function(Loading value) loading,
    required TResult Function(Initial value) initial,
    required TResult Function(Unauthorize value) unauthorize,
    required TResult Function(Error value) error,
  }) {
    return unauthorize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Data value)? data,
    TResult? Function(Loading value)? loading,
    TResult? Function(Initial value)? initial,
    TResult? Function(Unauthorize value)? unauthorize,
    TResult? Function(Error value)? error,
  }) {
    return unauthorize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data value)? data,
    TResult Function(Loading value)? loading,
    TResult Function(Initial value)? initial,
    TResult Function(Unauthorize value)? unauthorize,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (unauthorize != null) {
      return unauthorize(this);
    }
    return orElse();
  }
}

abstract class Unauthorize implements ResetPinAuthorizeState {
  const factory Unauthorize({required final LegacyLoginModel data}) =
      _$Unauthorize;

  LegacyLoginModel get data;
  @JsonKey(ignore: true)
  _$$UnauthorizeCopyWith<_$Unauthorize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorCopyWith<$Res> {
  factory _$$ErrorCopyWith(_$Error value, $Res Function(_$Error) then) =
      __$$ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorCopyWithImpl<$Res>
    extends _$ResetPinAuthorizeStateCopyWithImpl<$Res, _$Error>
    implements _$$ErrorCopyWith<$Res> {
  __$$ErrorCopyWithImpl(_$Error _value, $Res Function(_$Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$Error(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Error implements Error {
  const _$Error({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ResetPinAuthorizeState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCopyWith<_$Error> get copyWith =>
      __$$ErrorCopyWithImpl<_$Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ResetPinAuthorizeModel data) data,
    required TResult Function() loading,
    required TResult Function() initial,
    required TResult Function(LegacyLoginModel data) unauthorize,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ResetPinAuthorizeModel data)? data,
    TResult? Function()? loading,
    TResult? Function()? initial,
    TResult? Function(LegacyLoginModel data)? unauthorize,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ResetPinAuthorizeModel data)? data,
    TResult Function()? loading,
    TResult Function()? initial,
    TResult Function(LegacyLoginModel data)? unauthorize,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Data value) data,
    required TResult Function(Loading value) loading,
    required TResult Function(Initial value) initial,
    required TResult Function(Unauthorize value) unauthorize,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Data value)? data,
    TResult? Function(Loading value)? loading,
    TResult? Function(Initial value)? initial,
    TResult? Function(Unauthorize value)? unauthorize,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Data value)? data,
    TResult Function(Loading value)? loading,
    TResult Function(Initial value)? initial,
    TResult Function(Unauthorize value)? unauthorize,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements ResetPinAuthorizeState {
  const factory Error({required final String error}) = _$Error;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<_$Error> get copyWith => throw _privateConstructorUsedError;
}
