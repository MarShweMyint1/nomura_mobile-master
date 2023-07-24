import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveLocal {
  void saveSelector(String selector) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selector', selector);
  }

  Future<String?> getSelector() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var selector = prefs.getString('selector');
    debugPrint('GET Selecor===>$selector');
    return selector;
  }

  void isFingerprintSkip(bool skip) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFingerprintSkip', skip);
  }

  Future<bool?> getFingerprintSkip() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var isSkipped = prefs.getBool('isFingerprintSkip');
    return isSkipped;
  }

  clearFingerprint() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFingerprintSkip', false);
  }

  //! Save Cookie
  void saveCookie(String cookies) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('cookies', cookies);
  }

  Future<String?> getCookies() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var cookie = prefs.getString('cookies');
    debugPrint('GET COOKIE===>$cookie');
    return cookie;
  }

  void setException(String exception) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('exception', exception);
  }

  Future<String?> getException() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var exception = prefs.getString('exception');
    return exception;
  }

  void saveRouteName(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('route', name);
  }

  Future<String?> getRouteName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var routeName = prefs.getString('route');
    debugPrint('GET Route===>$routeName');
    return routeName;
  }

  clearCookie() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  void isSupportedByDevice(bool support) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isSupported', support);
  }

  Future<bool> getSupportedDevice() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var isSupportedDevice = prefs.getBool('isSupported') ?? false;
    debugPrint('GET Supported device===>$isSupportedDevice');
    return isSupportedDevice;
  }

  //! Save Auth TOKEN
  void saveAuthToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('authtoken', token);
  }

  Future<String> getAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('authtoken') ?? "";
    debugPrint('GET Auth Token===>$token');
    return token;
  }

  //! Save Skip Deregister
  void saveDeregister(bool deregister) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('deregister', deregister);
  }

  Future<bool?> getDeregister() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var deregister = prefs.getBool('deregister') ?? false;
    debugPrint('GET DEREGISTER===>$deregister');
    return deregister;
  }

  clearDeregister() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('deregister');
  }

  void saveUserid(String userid) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userid', userid);
  }

  Future<String> getUserid() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid = prefs.getString('userid') ?? "";
    debugPrint('GET userid===>$userid');
    return userid;
  }

  clearUserid() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("userid");
  }

  //! isChangePin
  void saveIsChangePin(bool isChangePin) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('changepin', isChangePin);
  }

  Future<bool?> getIsChangePin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var isChangePin = prefs.getBool('changepin') ?? false;
    debugPrint('GET isChangePin===>$isChangePin');
    return isChangePin;
  }

  clearIsChangePin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("changepin");
  }

  //! Clear all saved data
  clearAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  saveIsBiometricEnrolled(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('enrolledBiometric', value);
  }

  Future<bool?> getIsBiometricEnrolled() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var biometricState = prefs.getBool('enrolledBiometric');
    return biometricState;
  }

  saveisBiometricEnabled(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('biometricEnabled', value);
  }

  Future<bool?> getisBiometricEnabled() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var biometricState = prefs.getBool('biometricEnabled');
    return biometricState;
  }

  saveIsForgetPin(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isForgetPin', value);
  }

  Future<bool?> getIsForgetPin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var forgetPin = prefs.getBool('isForgetPin');
    return forgetPin;
  }

}
