import 'dart:html';
import 'dart:io';

import 'package:app/Telas/Iniciar.dart';
import 'package:flutter/material.dart';

import 'package:app/Telas/Iniciar.dart';
import 'package:app/Telas/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas na Mão',
      color: const Color(0xFF2C3639),
      home: Iniciar(),
    );
  }
}
