abstract class LocalStorageService {
  Future init();
  Future<bool> saveString(String key, dynamic value);
  Future<bool> saveBool(String key, dynamic value);
  Future<dynamic> get(String key);
}
