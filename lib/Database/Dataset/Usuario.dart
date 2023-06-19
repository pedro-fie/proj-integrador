import 'package:app/Database/Dataset/Dataset.dart';
import 'package:app/Database/Dataset/TableBase.dart';

class Usuario extends TableBase {
  Usuario({id = ""}) : super(id);

  String nome = "";
  String login = "";
  String email = "";
  String senha = "";

  @override
  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'login': login,
      'email': email,
      'senha': senha,
    };
  }

  @override
  void unMap(Map<String, dynamic>? ob) {
    if (ob == null) return;
    nome = ob["nome"];
    login = ob['login'];
    email = ob['email'];
    senha = ob['senha'];
  }
}
