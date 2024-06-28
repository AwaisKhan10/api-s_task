// ignore_for_file: avoid_print

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static SharedPreferences? _preferences;

  init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // List of const keys
  static const String userIdKey = 'userId';
  static const String tokenKey = 'token';

  // Getters and setters
  String? get userId => _getFromDisk(userIdKey);
  set userId(String? uid) => _saveToDisk(userIdKey, uid);

  String? get token => _getFromDisk(tokenKey);
  set token(String? token) => _saveToDisk(tokenKey, token);

  dynamic _getFromDisk(String key) {
    var value = _preferences?.get(key);
    print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  void _saveToDisk<T>(String key, T? content) {
    print('(TRACE) LocalStorageService:_saveToDisk. key: $key value: $content');

    if (content is String) {
      _preferences?.setString(key, content);
    }
    if (content == null) {
      _preferences?.remove(key);
    }
  }
}
