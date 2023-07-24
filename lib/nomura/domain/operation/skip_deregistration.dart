// import 'package:flutter/cupertino.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SkipDeregistration {
//   void saveDeregister(bool deregister) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('deregister', deregister);
//   }

//   Future<bool?> getDeregister() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     var deregister = prefs.getBool('deregister') ?? false;
//     debugPrint('GET DEREGISTER===>$deregister');
//     return deregister;
//   }

//   clearDeregister() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('deregister');
//   }
// }
