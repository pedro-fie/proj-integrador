import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';

import 'Telas/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AA',
      color: const Color(0xFF2C3639),
      home: Scaffold(body: TelaLogin()),
    );
  }
}
