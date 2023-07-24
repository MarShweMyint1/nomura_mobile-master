// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResultState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pinResult,
    required TResult Function() biometricResult,
    required TResult Function() fingerprintResult,
    required TResult Function() verifyBiometric,
    required TResult Function() verifyPIN,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
    required TResult Function(String? message) timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pinResult,
    TResult? Function()? biometricResult,
    TResult? Function()? fingerprintResult,
    TResult? Function()? verifyBiometric,
    TResult? Function()? verifyPIN,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
    TResult? Function(String? message)? timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pinResult,
    TResult Function()? biometricResult,
    TResult Function()? fingerprintResult,
    TResult Function()? verifyBiometric,
    TResult Function()? verifyPIN,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    TResult Function(String? message)? timeOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PinData value) pinResult,
    required TResult Function(BiometricData value) biometricResult,
    required TResult Function(FingerprintData value) fingerprintResult,
    required TResult Function(VerifyBiometricData value) verifyBiometric,
    required TResult Function(VerifyPINData value) verifyPIN,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(TimeOut value) timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PinData value)? pinResult,
    TResult? Function(BiometricData value)? biometricResult,
    TResult? Function(FingerprintData value)? fingerprintResult,
    TResult? Function(VerifyBiometricData value)? verifyBiometric,
    TResult? Function(VerifyPINData value)? verifyPIN,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(TimeOut value)? timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PinData value)? pinResult,
    TResult Function(BiometricData value)? biometricResult,
    TResult Function(FingerprintData value)? fingerprintResult,
    TResult Function(VerifyBiometricData value)? verifyBiometric,
    TResult Function(VerifyPINData value)? verifyPIN,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(TimeOut value)? timeOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultStateCopyWith<$Res> {
  factory $ResultStateCopyWith(
          ResultState value, $Res Function(ResultState) then) =
      _$ResultStateCopyWithImpl<$Res, ResultState>;
}

/// @nodoc
class _$ResultStateCopyWithImpl<$Res, $Val extends ResultState>
    implements $ResultStateCopyWith<$Res> {
  _$ResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PinDataCopyWith<$Res> {
  factory _$$PinDataCopyWith(_$PinData value, $Res Function(_$PinData) then) =
      __$$PinDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PinDataCopyWithImpl<$Res>
    extends _$ResultStateCopyWithImpl<$Res, _$PinData>
    implements _$$PinDataCopyWith<$Res> {
  __$$PinDataCopyWithImpl(_$PinData _value, $Res Function(_$PinData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PinData implements PinData {
  const _$PinData();

  @override
  String toString() {
    return 'ResultState.pinResult()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PinData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pinResult,
    required TResult Function() biometricResult,
    required TResult Function() fingerprintResult,
    required TResult Function() verifyBiometric,
    required TResult Function() verifyPIN,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
    required TResult Function(String? message) timeOut,
  }) {
    return pinResult();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pinResult,
    TResult? Function()? biometricResult,
    TResult? Function()? fingerprintResult,
    TResult? Function()? verifyBiometric,
    TResult? Function()? verifyPIN,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
    TResult? Function(String? message)? timeOut,
  }) {
    return pinResult?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pinResult,
    TResult Function()? biometricResult,
    TResult Function()? fingerprintResult,
    TResult Function()? verifyBiometric,
    TResult Function()? verifyPIN,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    TResult Function(String? message)? timeOut,
    required TResult orElse(),
  }) {
    if (pinResult != null) {
      return pinResult();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PinData value) pinResult,
    required TResult Function(BiometricData value) biometricResult,
    required TResult Function(FingerprintData value) fingerprintResult,
    required TResult Function(VerifyBiometricData value) verifyBiometric,
    required TResult Function(VerifyPINData value) verifyPIN,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(TimeOut value) timeOut,
  }) {
    return pinResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PinData value)? pinResult,
    TResult? Function(BiometricData value)? biometricResult,
    TResult? Function(FingerprintData value)? fingerprintResult,
    TResult? Function(VerifyBiometricData value)? verifyBiometric,
    TResult? Function(VerifyPINData value)? verifyPIN,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(TimeOut value)? timeOut,
  }) {
    return pinResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PinData value)? pinResult,
    TResult Function(BiometricData value)? biometricResult,
    TResult Function(FingerprintData value)? fingerprintResult,
    TResult Function(VerifyBiometricData value)? verifyBiometric,
    TResult Function(VerifyPINData value)? verifyPIN,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (pinResult != null) {
      return pinResult(this);
    }
    return orElse();
  }
}

abstract class PinData implements ResultState {
  const factory PinData() = _$PinData;
}

/// @nodoc
abstract class _$$BiometricDataCopyWith<$Res> {
  factory _$$BiometricDataCopyWith(
          _$BiometricData value, $Res Function(_$BiometricData) then) =
      __$$BiometricDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BiometricDataCopyWithImpl<$Res>
    extends _$ResultStateCopyWithImpl<$Res, _$BiometricData>
    implements _$$BiometricDataCopyWith<$Res> {
  __$$BiometricDataCopyWithImpl(
      _$BiometricData _value, $Res Function(_$BiometricData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BiometricData implements BiometricData {
  const _$BiometricData();

  @override
  String toString() {
    return 'ResultState.biometricResult()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BiometricData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pinResult,
    required TResult Function() biometricResult,
    required TResult Function() fingerprintResult,
    required TResult Function() verifyBiometric,
    required TResult Function() verifyPIN,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
    required TResult Function(String? message) timeOut,
  }) {
    return biometricResult();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pinResult,
    TResult? Function()? biometricResult,
    TResult? Function()? fingerprintResult,
    TResult? Function()? verifyBiometric,
    TResult? Function()? verifyPIN,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
    TResult? Function(String? message)? timeOut,
  }) {
    return biometricResult?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pinResult,
    TResult Function()? biometricResult,
    TResult Function()? fingerprintResult,
    TResult Function()? verifyBiometric,
    TResult Function()? verifyPIN,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    TResult Function(String? message)? timeOut,
    required TResult orElse(),
  }) {
    if (biometricResult != null) {
      return biometricResult();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PinData value) pinResult,
    required TResult Function(BiometricData value) biometricResult,
    required TResult Function(FingerprintData value) fingerprintResult,
    required TResult Function(VerifyBiometricData value) verifyBiometric,
    required TResult Function(VerifyPINData value) verifyPIN,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(TimeOut value) timeOut,
  }) {
    return biometricResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PinData value)? pinResult,
    TResult? Function(BiometricData value)? biometricResult,
    TResult? Function(FingerprintData value)? fingerprintResult,
    TResult? Function(VerifyBiometricData value)? verifyBiometric,
    TResult? Function(VerifyPINData value)? verifyPIN,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(TimeOut value)? timeOut,
  }) {
    return biometricResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PinData value)? pinResult,
    TResult Function(BiometricData value)? biometricResult,
    TResult Function(FingerprintData value)? fingerprintResult,
    TResult Function(VerifyBiometricData value)? verifyBiometric,
    TResult Function(VerifyPINData value)? verifyPIN,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (biometricResult != null) {
      return biometricResult(this);
    }
    return orElse();
  }
}

abstract class BiometricData implements ResultState {
  const factory BiometricData() = _$BiometricData;
}

/// @nodoc
abstract class _$$FingerprintDataCopyWith<$Res> {
  factory _$$FingerprintDataCopyWith(
          _$FingerprintData value, $Res Function(_$FingerprintData) then) =
      __$$FingerprintDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FingerprintDataCopyWithImpl<$Res>
    extends _$ResultStateCopyWithImpl<$Res, _$FingerprintData>
    implements _$$FingerprintDataCopyWith<$Res> {
  __$$FingerprintDataCopyWithImpl(
      _$FingerprintData _value, $Res Function(_$FingerprintData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FingerprintData implements FingerprintData {
  const _$FingerprintData();

  @override
  String toString() {
    return 'ResultState.fingerprintResult()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FingerprintData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pinResult,
    required TResult Function() biometricResult,
    required TResult Function() fingerprintResult,
    required TResult Function() verifyBiometric,
    required TResult Function() verifyPIN,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
    required TResult Function(String? message) timeOut,
  }) {
    return fingerprintResult();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pinResult,
    TResult? Function()? biometricResult,
    TResult? Function()? fingerprintResult,
    TResult? Function()? verifyBiometric,
    TResult? Function()? verifyPIN,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
    TResult? Function(String? message)? timeOut,
  }) {
    return fingerprintResult?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pinResult,
    TResult Function()? biometricResult,
    TResult Function()? fingerprintResult,
    TResult Function()? verifyBiometric,
    TResult Function()? verifyPIN,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    TResult Function(String? message)? timeOut,
    required TResult orElse(),
  }) {
    if (fingerprintResult != null) {
      return fingerprintResult();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PinData value) pinResult,
    required TResult Function(BiometricData value) biometricResult,
    required TResult Function(FingerprintData value) fingerprintResult,
    required TResult Function(VerifyBiometricData value) verifyBiometric,
    required TResult Function(VerifyPINData value) verifyPIN,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(TimeOut value) timeOut,
  }) {
    return fingerprintResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PinData value)? pinResult,
    TResult? Function(BiometricData value)? biometricResult,
    TResult? Function(FingerprintData value)? fingerprintResult,
    TResult? Function(VerifyBiometricData value)? verifyBiometric,
    TResult? Function(VerifyPINData value)? verifyPIN,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(TimeOut value)? timeOut,
  }) {
    return fingerprintResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PinData value)? pinResult,
    TResult Function(BiometricData value)? biometricResult,
    TResult Function(FingerprintData value)? fingerprintResult,
    TResult Function(VerifyBiometricData value)? verifyBiometric,
    TResult Function(VerifyPINData value)? verifyPIN,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (fingerprintResult != null) {
      return fingerprintResult(this);
    }
    return orElse();
  }
}

abstract class FingerprintData implements ResultState {
  const factory FingerprintData() = _$FingerprintData;
}

/// @nodoc
abstract class _$$VerifyBiometricDataCopyWith<$Res> {
  factory _$$VerifyBiometricDataCopyWith(_$VerifyBiometricData value,
          $Res Function(_$VerifyBiometricData) then) =
      __$$VerifyBiometricDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifyBiometricDataCopyWithImpl<$Res>
    extends _$ResultStateCopyWithImpl<$Res, _$VerifyBiometricData>
    implements _$$VerifyBiometricDataCopyWith<$Res> {
  __$$VerifyBiometricDataCopyWithImpl(
      _$VerifyBiometricData _value, $Res Function(_$VerifyBiometricData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VerifyBiometricData implements VerifyBiometricData {
  const _$VerifyBiometricData();

  @override
  String toString() {
    return 'ResultState.verifyBiometric()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VerifyBiometricData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pinResult,
    required TResult Function() biometricResult,
    required TResult Function() fingerprintResult,
    required TResult Function() verifyBiometric,
    required TResult Function() verifyPIN,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
    required TResult Function(String? message) timeOut,
  }) {
    return verifyBiometric();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pinResult,
    TResult? Function()? biometricResult,
    TResult? Function()? fingerprintResult,
    TResult? Function()? verifyBiometric,
    TResult? Function()? verifyPIN,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
    TResult? Function(String? message)? timeOut,
  }) {
    return verifyBiometric?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pinResult,
    TResult Function()? biometricResult,
    TResult Function()? fingerprintResult,
    TResult Function()? verifyBiometric,
    TResult Function()? verifyPIN,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    TResult Function(String? message)? timeOut,
    required TResult orElse(),
  }) {
    if (verifyBiometric != null) {
      return verifyBiometric();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PinData value) pinResult,
    required TResult Function(BiometricData value) biometricResult,
    required TResult Function(FingerprintData value) fingerprintResult,
    required TResult Function(VerifyBiometricData value) verifyBiometric,
    required TResult Function(VerifyPINData value) verifyPIN,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(TimeOut value) timeOut,
  }) {
    return verifyBiometric(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PinData value)? pinResult,
    TResult? Function(BiometricData value)? biometricResult,
    TResult? Function(FingerprintData value)? fingerprintResult,
    TResult? Function(VerifyBiometricData value)? verifyBiometric,
    TResult? Function(VerifyPINData value)? verifyPIN,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(TimeOut value)? timeOut,
  }) {
    return verifyBiometric?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PinData value)? pinResult,
    TResult Function(BiometricData value)? biometricResult,
    TResult Function(FingerprintData value)? fingerprintResult,
    TResult Function(VerifyBiometricData value)? verifyBiometric,
    TResult Function(VerifyPINData value)? verifyPIN,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (verifyBiometric != null) {
      return verifyBiometric(this);
    }
    return orElse();
  }
}

abstract class VerifyBiometricData implements ResultState {
  const factory VerifyBiometricData() = _$VerifyBiometricData;
}

/// @nodoc
abstract class _$$VerifyPINDataCopyWith<$Res> {
  factory _$$VerifyPINDataCopyWith(
          _$VerifyPINData value, $Res Function(_$VerifyPINData) then) =
      __$$VerifyPINDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifyPINDataCopyWithImpl<$Res>
    extends _$ResultStateCopyWithImpl<$Res, _$VerifyPINData>
    implements _$$VerifyPINDataCopyWith<$Res> {
  __$$VerifyPINDataCopyWithImpl(
      _$VerifyPINData _value, $Res Function(_$VerifyPINData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VerifyPINData implements VerifyPINData {
  const _$VerifyPINData();

  @override
  String toString() {
    return 'ResultState.verifyPIN()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VerifyPINData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pinResult,
    required TResult Function() biometricResult,
    required TResult Function() fingerprintResult,
    required TResult Function() verifyBiometric,
    required TResult Function() verifyPIN,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
    required TResult Function(String? message) timeOut,
  }) {
    return verifyPIN();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pinResult,
    TResult? Function()? biometricResult,
    TResult? Function()? fingerprintResult,
    TResult? Function()? verifyBiometric,
    TResult? Function()? verifyPIN,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
    TResult? Function(String? message)? timeOut,
  }) {
    return verifyPIN?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pinResult,
    TResult Function()? biometricResult,
    TResult Function()? fingerprintResult,
    TResult Function()? verifyBiometric,
    TResult Function()? verifyPIN,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    TResult Function(String? message)? timeOut,
    required TResult orElse(),
  }) {
    if (verifyPIN != null) {
      return verifyPIN();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PinData value) pinResult,
    required TResult Function(BiometricData value) biometricResult,
    required TResult Function(FingerprintData value) fingerprintResult,
    required TResult Function(VerifyBiometricData value) verifyBiometric,
    required TResult Function(VerifyPINData value) verifyPIN,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(TimeOut value) timeOut,
  }) {
    return verifyPIN(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PinData value)? pinResult,
    TResult? Function(BiometricData value)? biometricResult,
    TResult? Function(FingerprintData value)? fingerprintResult,
    TResult? Function(VerifyBiometricData value)? verifyBiometric,
    TResult? Function(VerifyPINData value)? verifyPIN,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(TimeOut value)? timeOut,
  }) {
    return verifyPIN?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PinData value)? pinResult,
    TResult Function(BiometricData value)? biometricResult,
    TResult Function(FingerprintData value)? fingerprintResult,
    TResult Function(VerifyBiometricData value)? verifyBiometric,
    TResult Function(VerifyPINData value)? verifyPIN,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (verifyPIN != null) {
      return verifyPIN(this);
    }
    return orElse();
  }
}

abstract class VerifyPINData implements ResultState {
  const factory VerifyPINData() = _$VerifyPINData;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$ResultStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'ResultState.initial()';
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
    required TResult Function() pinResult,
    required TResult Function() biometricResult,
    required TResult Function() fingerprintResult,
    required TResult Function() verifyBiometric,
    required TResult Function() verifyPIN,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
    required TResult Function(String? message) timeOut,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pinResult,
    TResult? Function()? biometricResult,
    TResult? Function()? fingerprintResult,
    TResult? Function()? verifyBiometric,
    TResult? Function()? verifyPIN,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
    TResult? Function(String? message)? timeOut,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pinResult,
    TResult Function()? biometricResult,
    TResult Function()? fingerprintResult,
    TResult Function()? verifyBiometric,
    TResult Function()? verifyPIN,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    TResult Function(String? message)? timeOut,
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
    required TResult Function(PinData value) pinResult,
    required TResult Function(BiometricData value) biometricResult,
    required TResult Function(FingerprintData value) fingerprintResult,
    required TResult Function(VerifyBiometricData value) verifyBiometric,
    required TResult Function(VerifyPINData value) verifyPIN,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(TimeOut value) timeOut,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PinData value)? pinResult,
    TResult? Function(BiometricData value)? biometricResult,
    TResult? Function(FingerprintData value)? fingerprintResult,
    TResult? Function(VerifyBiometricData value)? verifyBiometric,
    TResult? Function(VerifyPINData value)? verifyPIN,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(TimeOut value)? timeOut,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PinData value)? pinResult,
    TResult Function(BiometricData value)? biometricResult,
    TResult Function(FingerprintData value)? fingerprintResult,
    TResult Function(VerifyBiometricData value)? verifyBiometric,
    TResult Function(VerifyPINData value)? verifyPIN,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ResultState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$ResultStateCopyWithImpl<$Res, _$Loading>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'ResultState.loading()';
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
    required TResult Function() pinResult,
    required TResult Function() biometricResult,
    required TResult Function() fingerprintResult,
    required TResult Function() verifyBiometric,
    required TResult Function() verifyPIN,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
    required TResult Function(String? message) timeOut,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pinResult,
    TResult? Function()? biometricResult,
    TResult? Function()? fingerprintResult,
    TResult? Function()? verifyBiometric,
    TResult? Function()? verifyPIN,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
    TResult? Function(String? message)? timeOut,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pinResult,
    TResult Function()? biometricResult,
    TResult Function()? fingerprintResult,
    TResult Function()? verifyBiometric,
    TResult Function()? verifyPIN,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    TResult Function(String? message)? timeOut,
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
    required TResult Function(PinData value) pinResult,
    required TResult Function(BiometricData value) biometricResult,
    required TResult Function(FingerprintData value) fingerprintResult,
    required TResult Function(VerifyBiometricData value) verifyBiometric,
    required TResult Function(VerifyPINData value) verifyPIN,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(TimeOut value) timeOut,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PinData value)? pinResult,
    TResult? Function(BiometricData value)? biometricResult,
    TResult? Function(FingerprintData value)? fingerprintResult,
    TResult? Function(VerifyBiometricData value)? verifyBiometric,
    TResult? Function(VerifyPINData value)? verifyPIN,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(TimeOut value)? timeOut,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PinData value)? pinResult,
    TResult Function(BiometricData value)? biometricResult,
    TResult Function(FingerprintData value)? fingerprintResult,
    TResult Function(VerifyBiometricData value)? verifyBiometric,
    TResult Function(VerifyPINData value)? verifyPIN,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ResultState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class _$$ErrorCopyWith<$Res> {
  factory _$$ErrorCopyWith(_$Error value, $Res Function(_$Error) then) =
      __$$ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ErrorCopyWithImpl<$Res>
    extends _$ResultStateCopyWithImpl<$Res, _$Error>
    implements _$$ErrorCopyWith<$Res> {
  __$$ErrorCopyWithImpl(_$Error _value, $Res Function(_$Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$Error(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Error implements Error {
  const _$Error({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'ResultState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCopyWith<_$Error> get copyWith =>
      __$$ErrorCopyWithImpl<_$Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pinResult,
    required TResult Function() biometricResult,
    required TResult Function() fingerprintResult,
    required TResult Function() verifyBiometric,
    required TResult Function() verifyPIN,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
    required TResult Function(String? message) timeOut,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pinResult,
    TResult? Function()? biometricResult,
    TResult? Function()? fingerprintResult,
    TResult? Function()? verifyBiometric,
    TResult? Function()? verifyPIN,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
    TResult? Function(String? message)? timeOut,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pinResult,
    TResult Function()? biometricResult,
    TResult Function()? fingerprintResult,
    TResult Function()? verifyBiometric,
    TResult Function()? verifyPIN,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    TResult Function(String? message)? timeOut,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PinData value) pinResult,
    required TResult Function(BiometricData value) biometricResult,
    required TResult Function(FingerprintData value) fingerprintResult,
    required TResult Function(VerifyBiometricData value) verifyBiometric,
    required TResult Function(VerifyPINData value) verifyPIN,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(TimeOut value) timeOut,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PinData value)? pinResult,
    TResult? Function(BiometricData value)? biometricResult,
    TResult? Function(FingerprintData value)? fingerprintResult,
    TResult? Function(VerifyBiometricData value)? verifyBiometric,
    TResult? Function(VerifyPINData value)? verifyPIN,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(TimeOut value)? timeOut,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PinData value)? pinResult,
    TResult Function(BiometricData value)? biometricResult,
    TResult Function(FingerprintData value)? fingerprintResult,
    TResult Function(VerifyBiometricData value)? verifyBiometric,
    TResult Function(VerifyPINData value)? verifyPIN,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements ResultState {
  const factory Error({final String? message}) = _$Error;

  String? get message;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<_$Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimeOutCopyWith<$Res> {
  factory _$$TimeOutCopyWith(_$TimeOut value, $Res Function(_$TimeOut) then) =
      __$$TimeOutCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$TimeOutCopyWithImpl<$Res>
    extends _$ResultStateCopyWithImpl<$Res, _$TimeOut>
    implements _$$TimeOutCopyWith<$Res> {
  __$$TimeOutCopyWithImpl(_$TimeOut _value, $Res Function(_$TimeOut) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$TimeOut(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TimeOut implements TimeOut {
  const _$TimeOut({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'ResultState.timeOut(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeOut &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeOutCopyWith<_$TimeOut> get copyWith =>
      __$$TimeOutCopyWithImpl<_$TimeOut>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pinResult,
    required TResult Function() biometricResult,
    required TResult Function() fingerprintResult,
    required TResult Function() verifyBiometric,
    required TResult Function() verifyPIN,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
    required TResult Function(String? message) timeOut,
  }) {
    return timeOut(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pinResult,
    TResult? Function()? biometricResult,
    TResult? Function()? fingerprintResult,
    TResult? Function()? verifyBiometric,
    TResult? Function()? verifyPIN,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
    TResult? Function(String? message)? timeOut,
  }) {
    return timeOut?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pinResult,
    TResult Function()? biometricResult,
    TResult Function()? fingerprintResult,
    TResult Function()? verifyBiometric,
    TResult Function()? verifyPIN,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    TResult Function(String? message)? timeOut,
    required TResult orElse(),
  }) {
    if (timeOut != null) {
      return timeOut(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PinData value) pinResult,
    required TResult Function(BiometricData value) biometricResult,
    required TResult Function(FingerprintData value) fingerprintResult,
    required TResult Function(VerifyBiometricData value) verifyBiometric,
    required TResult Function(VerifyPINData value) verifyPIN,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(TimeOut value) timeOut,
  }) {
    return timeOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PinData value)? pinResult,
    TResult? Function(BiometricData value)? biometricResult,
    TResult? Function(FingerprintData value)? fingerprintResult,
    TResult? Function(VerifyBiometricData value)? verifyBiometric,
    TResult? Function(VerifyPINData value)? verifyPIN,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(TimeOut value)? timeOut,
  }) {
    return timeOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PinData value)? pinResult,
    TResult Function(BiometricData value)? biometricResult,
    TResult Function(FingerprintData value)? fingerprintResult,
    TResult Function(VerifyBiometricData value)? verifyBiometric,
    TResult Function(VerifyPINData value)? verifyPIN,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(TimeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (timeOut != null) {
      return timeOut(this);
    }
    return orElse();
  }
}

abstract class TimeOut implements ResultState {
  const factory TimeOut({final String? message}) = _$TimeOut;

  String? get message;
  @JsonKey(ignore: true)
  _$$TimeOutCopyWith<_$TimeOut> get copyWith =>
      throw _privateConstructorUsedError;
}
