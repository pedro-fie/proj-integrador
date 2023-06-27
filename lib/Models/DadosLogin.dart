import 'package:app/Database/Database.dart';
import 'package:app/Database/Dataset/Usuario.dart';
import 'package:app/Storage/Storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login {
  String nome = "";
  String login = "";
  String senha = "";
  String senhaRepetida = "";
  String email = "";

  Future<bool> CheckLogin() async {
    Database db = Database();
    Usuario? usu;
    await db.usuarios.Get(null, field: 'Email', isEqualTo: login).then(
          (value) => {
            usu = value.isNotEmpty ? value[0] : null,
          },
        );

    if (usu == null) return false;

    if (usu!.senha != senha) return false;

    Storage.setStorage("usuarioId", usu!.id);
    Storage.setStorage("biografia", usu!.bio);
    Storage.setStorage("nomeUsuario", usu!.login);

    return true;
  }

  void Registrar() {
    Database db = Database();
    Usuario usu = Usuario();
    usu.email = email;
    usu.login = login;
    usu.senha = senha;
    usu.nome = nome;
    db.usuarios.Add(usu);
  }
}
