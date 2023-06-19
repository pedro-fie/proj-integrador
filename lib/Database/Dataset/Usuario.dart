import 'package:app/Database/Dataset/Dataset.dart';

class Usuario {
  Usuario({id = "", dynamic ob}) {
    if (ob == null) return;
    nome = ob.nome;
    login = ob.login;
    email = ob.email;
    hashSenha = ob.hashSenha;
  }

  String nome = "";
  String login = "";
  String email = "";
  String hashSenha = "";
}
