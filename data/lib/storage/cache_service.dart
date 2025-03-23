abstract class CacheService {
  Future<void> saveData(String key, String data);
  Future<String?> getData(String key);
}
