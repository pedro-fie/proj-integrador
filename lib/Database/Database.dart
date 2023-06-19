import 'package:app/Database/Dataset/Dataset.dart';
import 'package:app/Database/Dataset/Receita.dart';
import 'package:app/Database/Dataset/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final _db = FirebaseFirestore.instance;

  Database() {
    usuarios = Dataset(_db, 'Usuario');
    receitas = Dataset(_db, 'Receita');
  }

  late Dataset<Usuario> usuarios;
  late Dataset<Receita> receitas;
}
