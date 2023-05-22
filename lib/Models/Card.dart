import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class Cartao {
  Uint8List? image;
  String text = "";
  int id = 0;
  String sobre = "";
  String preparo = "";

  Cartao(this.text, this.id, String img) {
    readImage(img);
  }

  Future<void> readImage(String file) async {
    HttpClient client = HttpClient();
    await client.get('localhost', 80, file);
  }
}
