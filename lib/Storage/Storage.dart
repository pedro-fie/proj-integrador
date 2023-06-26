import 'dart:convert';

import 'package:localstorage/localstorage.dart';

class Storage {
  static final LocalStorage _local = LocalStorage('store.json');
  static Future<void> prepare() async => await _local.ready;

  static void setStorage(String campo, String value) {
    _local.setItem(campo, jsonEncode(value));
  }

  static T? getStorage<T>(String campo) {
    var data = _local.getItem(campo);
    if (data == null) return null;
    return jsonDecode(data) as T;
  }

  static void clear() => _local.clear();
}
