abstract class IStorage {
  void setData(String key, String value);
  String getData(String key);
  void clean();
}
