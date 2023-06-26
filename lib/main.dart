import 'dart:html';
import 'dart:io';

import 'package:app/Telas/Iniciar.dart';
import 'package:app/Telas/Principal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app/firebase_options.dart';

import 'package:app/Telas/Iniciar.dart';
import 'package:app/Telas/Login.dart';
import 'package:app/Storage/Storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Storage.prepare();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas na Mão',
      color: const Color(0xFF2C3639),
      home: Storage.getStorage<String>("usuarioId") == null
          ? Iniciar()
          : TelaPrincipal(),
    );
  }
}
