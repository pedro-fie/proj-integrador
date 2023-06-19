import 'dart:convert';

import 'package:localstorage/localstorage.dart';

class Storage {
  static final LocalStorage _local = new LocalStorage('store.json');

  static void SetToken(String value) =>
      _local.setItem('token', jsonEncode(value));

  static String GetToken() => _local.getItem('token');
}
