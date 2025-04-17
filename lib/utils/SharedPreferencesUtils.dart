import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {

  static const checkFirstTime = "checkFirstTime";

  static Future<void> setFirstTime(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(checkFirstTime, value);
  }

  static Future<bool> getFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(checkFirstTime) ?? true;
  }

}
