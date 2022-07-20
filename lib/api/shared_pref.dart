import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constant.dart';

class SharedPref {
  static Future setLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(loggedInSharedPreference, true);
  }

  static Future<bool?> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(loggedInSharedPreference) ;
  }

  static Future setCustomerData(
      {required String id, required String token}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(customerDataSharedPreference, [id, token]);
  }

  static Future<List<String>> getCustomerData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(customerDataSharedPreference) ?? [];
  }

  static Future clearSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
