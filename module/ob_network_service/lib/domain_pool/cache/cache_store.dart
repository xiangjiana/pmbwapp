abstract class CacheStore {
  Future<List<String>> get();

  Future<void> put(String url);
}
