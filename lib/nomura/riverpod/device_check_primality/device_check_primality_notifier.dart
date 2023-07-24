part of 'device_check_primality_provider.dart';

class DeviceCheckPrimalityNotifier
    extends StateNotifier<DeviceCheckPrimalityState> {
  DeviceCheckPrimalityNotifier(
      {required DevicePrimalityCheckUsecase devicePrimalityCheckUsecase,
      DeviceCheckPrimalityState? initState})
      : _devicePrimalityCheckUsecase = devicePrimalityCheckUsecase,
        super(initState ?? const DeviceCheckPrimalityState.initial());

  final DevicePrimalityCheckUsecase _devicePrimalityCheckUsecase;
  void reset() => state = const DeviceCheckPrimalityState.initial();
  Future<void> deviceCheckPrimalityFunc(ValidateUserParams params) async {
    state = const DeviceCheckPrimalityState.loading();

    final result =
        await _devicePrimalityCheckUsecase.devicePrimalityCheck(params);
    debugPrint('result runtime=====>${result.runtimeType}');
    result.fold(
        (failure) => state =
            DeviceCheckPrimalityState.error(message: failure.toString()),
        (success) {
      debugPrint('success runtime =================>>${success..runtimeType}');
      if (success.runtimeType == DevicePrimalityModel) {
        debugPrint('device check model======>');
        state = DeviceCheckPrimalityState.data(data: success);
      } else {
        state = DeviceCheckPrimalityState.noPrimaryDevice(data: success);
      }
    });
  }
}
