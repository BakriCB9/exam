abstract class LocalDatasourceContract {
  Future<void> saveUserToken(String value);
  Future<String?> getUserToken(String key);
}
