abstract interface class LocalStorageService {
  Future init();
  Future<bool> saveString(String key, dynamic value);
  Future<bool> saveBool(String key, dynamic value);
  Future<String?> getString(String key);
  Future<bool?> getBool(String key);
}
