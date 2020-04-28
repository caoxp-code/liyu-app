import 'package:shared_preferences/shared_preferences.dart';

/// 本地缓存key-value值,其中值为简单的字符串或数值
class LocalStorage {
  static save<T>(String key, T value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (value is int) {
      pref.setInt(key, value);
    } else if (value is double) {
      pref.setDouble(key, value);
    } else if (value is String) {
      pref.setString(key, value);
    }
  }
  static get(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.get(key);
  }
  static delete(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(key);
  }
  static clear() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
  
}