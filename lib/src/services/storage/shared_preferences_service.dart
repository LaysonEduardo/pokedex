import 'package:pokedex_colaboraapp/src/models/app/app_exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base/local_storage_base.dart';

final class SharedPreferencesStorageService implements LocalStorageService {
  late SharedPreferences _storage;

  @override
  Future init() async {
    try {
      _storage = await SharedPreferences.getInstance();
    } catch (err) {
      throw LocalStorageException();
    }
  }

  @override
  Future<bool> saveBool(String key, value) async {
    return await _storage.setBool(key, value);
  }

  @override
  Future<bool> saveString(String key, value) async {
    return await _storage.setString(key, value);
  }

  @override
  Future<bool?> getBool(String key) async {
    return _storage.getBool(key);
  }

  @override
  Future<String?> getString(String key) async {
    return _storage.getString(key);
  }
}
