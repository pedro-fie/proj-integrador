import 'package:app/Database/Database.dart';
import 'package:app/Database/Dataset/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login {
  String login = "";
  String senha = "";

  Future<bool> CheckLogin() async {
    Database db = Database();
    Usuario? usu;
    await db.usuarios.Get(null, field: 'Email', isEqualTo: login).then(
          (value) => {
            if (value.isNotEmpty) print(value[0]),
            usu = value.isNotEmpty ? value[0] : null,
          },
        );

    print(usu);
    if (usu == null) return false;

    if (usu!.senha != senha) return false;

    return true;
  }
}
