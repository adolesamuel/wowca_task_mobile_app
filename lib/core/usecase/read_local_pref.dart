import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalPreference {
  final SharedPreferences _sharedPreferences;

  LocalPreference(this._sharedPreferences);

  Future<bool> checkPref(String key) async {
    return _sharedPreferences.containsKey(key) &&
        _sharedPreferences.getString(key) != null;
  }

  Future<dynamic> readPrefFromObject(String key1, {String key}) async {
    if (await checkPref(key1)) {
      final decodedString =
          await json.decode(_sharedPreferences.getString(key1));
      if (key != null) {
        final result = decodedString[key];
        return result;
      } else {
        final result = decodedString;
        return result;
      }
    } else {
      return null;
    }
  }
}
