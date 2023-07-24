import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nomura_mobile/nomura/data/model/device_primality_model.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_login_model.dart';

part 'device_check_primality_state.freezed.dart';

extension Getters on DeviceCheckPrimalityState {
  bool get isLoading => this is Loading;
}

@freezed
class DeviceCheckPrimalityState with _$DeviceCheckPrimalityState {
  const factory DeviceCheckPrimalityState.data(
      {required DevicePrimalityModel data}) = Data;
  const factory DeviceCheckPrimalityState.initial() = Initial;
  const factory DeviceCheckPrimalityState.loading() = Loading;
  const factory DeviceCheckPrimalityState.noPrimaryDevice({required LegacyLoginModel data}) = NoPrimaryDevice;
  const factory DeviceCheckPrimalityState.error({String? message}) = Error;
  const factory DeviceCheckPrimalityState.timeOut({String? message}) = TimeOut;
}
