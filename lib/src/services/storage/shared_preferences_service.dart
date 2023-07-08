import 'package:pokedex_colaboraapp/src/models/app/app_exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base/local_storage_base.dart';

final class SharedPreferencesStorageService extends LocalStorageService {
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
  Future<bool> save(String key, dynamic value) async {
    return await _storage.setString(key, value);
  }

  @override
  Future<dynamic> get(String key) async {
    return _storage.getString(key);
  }

  @override
  Future<bool> saveBool(String key, value) {
    // TODO: implement saveBool
    throw UnimplementedError();
  }

  @override
  Future<bool> saveString(String key, value) {
    // TODO: implement saveString
    throw UnimplementedError();
  }
}
