import 'dart:html';

import 'i_storage.dart';

class SessionStorage implements IStorage {
  @override
  void setData(String key, String value) => window.sessionStorage[key] = value;

  @override
  String getData(String key) => window.sessionStorage[key] ?? '';

  @override
  void clean() => window.sessionStorage.clear();
}
