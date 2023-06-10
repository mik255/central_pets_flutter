abstract class ILocalRepository {
  String? get(String key);

  Future<bool> set(String key, String value);

  Future<bool> remove(String key);

  Future<bool> clear();

  Future<bool> containsKey(String key);

  Future<int> getLength();

  Future<List<String>> getList();
}
