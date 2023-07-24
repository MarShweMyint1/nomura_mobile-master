import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';

final counterProvider = StateNotifierProvider.autoDispose<CounterNotifier, int>(
    (ref) => CounterNotifier());

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(1);
  void increment() {
    ++state;
  }
}

final counterResendProvider =
    StateNotifierProvider.autoDispose<CounterResendNotifier, int>(
        (ref) => CounterResendNotifier());

class CounterResendNotifier extends StateNotifier<int> {
  CounterResendNotifier() : super(1);
  void increment() {
    ++state;
  }
}

final dispatchTargetProvider =
    StateNotifierProvider.autoDispose<MyDispatchTarget, List<dynamic>>((ref) {
  return MyDispatchTarget();
});

class MyDispatchTarget extends StateNotifier<List<dynamic>> {
  MyDispatchTarget() : super([]);
  void saveDispatchTarget(List<dynamic> dispatchTargets) =>
      state = dispatchTargets;
}

final cookieProvider =
    StateNotifierProvider<CookieStorage, List<Cookie>>((ref) {
  return CookieStorage();
});

class CookieStorage extends StateNotifier<List<Cookie>> {
  CookieStorage() : super([]);
  void saveCookieList(List<Cookie> cookieList) => state = cookieList;
}

final authorizationStorageProvider =
    StateNotifierProvider<AuthorizationProviderStorage, dynamic>((ref) {
  return AuthorizationProviderStorage();
});

class AuthorizationProviderStorage extends StateNotifier<dynamic> {
  AuthorizationProviderStorage() : super(null);
  void saveAuthProvider(AuthorizationProvider authorizationProvider) =>
      state = authorizationProvider;
}

// final isSkipBiometricProvider = StateProvider<bool>((ref) => false);

final isChangePinProvider = StateProvider<bool>((ref) => false);

final toggleValueProvider =
    StateNotifierProvider.autoDispose<ToggleValue, bool>((ref) {
  return ToggleValue();
});

class ToggleValue extends StateNotifier<bool> {
  ToggleValue() : super(false);
  bool toggle(bool toggleValue) => state = !toggleValue;
}

final authenticatorProvider =
    StateNotifierProvider<AuthenticatorProvider, Set<Authenticator>>((ref) {
  return AuthenticatorProvider();
});

class AuthenticatorProvider extends StateNotifier<Set<Authenticator>> {
  AuthenticatorProvider() : super({});
  void saveAuthenticator(Set<Authenticator> authenticators) =>
      state = authenticators;
}

final bioEnDisProvider = StateProvider<bool>((ref) => false);
final usernameProvider = StateNotifierProvider<UserProvider, String>((ref) {
  return UserProvider();
});

class UserProvider extends StateNotifier<String> {
  UserProvider() : super('');
  void saveUserName(String username) => state = username;
}

final pinResultOriginProvider = StateProvider((ref) => 'changePin');

final pinChangeCancelProvider = StateProvider<bool>((ref) => false);

final currentPinProvider =
    StateNotifierProvider<CurrentPinProvider, String>((ref) {
  return CurrentPinProvider();
});

class CurrentPinProvider extends StateNotifier<String> {
  CurrentPinProvider() : super('');
  void saveCurrentPin(String pin) => state = pin;

}
  final isBiometricProvider=StateProvider<bool>((ref)=>false);

