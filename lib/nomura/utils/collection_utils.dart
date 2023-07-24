import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/utils/constant_utils.dart';
import 'package:nomura_mobile/nomura/utils/device_detail.dart';

Future<Set<T>> whereAsync<T>(
  Set<T> elements,
  Future<bool> Function(T) condition,
) async {
  final result = <T>{};
  for (var element in elements) {
    if (await condition(element)) {
      result.add(element);
    }
  }
  return Future.value(result);
}

Future<bool> anyAsync<T>(
  Set<T> elements,
  Future<bool> Function(T) condition,
) async {
  for (var element in elements) {
    if (await condition(element)) {
      return Future.value(true);
    }
  }
  return Future.value(false);
}

bool regExpStringType(String value) {
  return RegExp(r'^[a-zA-Z0-9]{8,10}$').hasMatch(value);
}

bool regExpNumberType(String value) {
  return RegExp(r'^[0-9]{6}$').hasMatch(value);
}

bool regExpVarType(String value) {
  return RegExp(r'^[a-zA-Z0-9]{6}$').hasMatch(value);
}

Future<bool> fingerprintEnrollment() async {
  if (isIOS) {
    return false;
  } else {
    var osversion = await getDeviceOSLevel();
    var skip = await SaveLocal().getFingerprintSkip();
    return (int.parse(osversion) < 29 && !skip!);
  }
}
