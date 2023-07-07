abstract class LocalStorageService {
  Future init();
  Future<bool> save(String key, dynamic value);
  Future<dynamic> get(String key);
}
