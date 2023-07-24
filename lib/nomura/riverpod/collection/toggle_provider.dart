import 'package:flutter_riverpod/flutter_riverpod.dart';

final toggleValueProvider =
    StateNotifierProvider.autoDispose<ToggleValue, bool>((ref) {
  return ToggleValue();
});

class ToggleValue extends StateNotifier<bool> {
  ToggleValue() : super(false);
  void toggle(bool toggleValue) => state = !toggleValue;
}
