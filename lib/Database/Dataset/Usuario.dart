import 'package:app/Database/Dataset/Dataset.dart';
import 'package:app/Database/Dataset/TableBase.dart';

class Usuario extends TableBase {
  Usuario({id = ""}) : super(id);

  @override
  Object getObject() {
    return this;
  }

  String nome = "";
  String login = "";
  String email = "";
  String senha = "";
  String bio = "";

  @override
  Map<String, dynamic> toMap() {
    return {
      'Nome': nome,
      'Login': login,
      'Email': email,
      'Senha': senha,
      'Bio': bio,
    };
  }

  @override
  void unMap(Map<String, dynamic>? ob, String id) {
    if (ob == null) return;
    this.id = id;
    nome = ob["Nome"] ?? "";
    login = ob['Login'] ?? "";
    email = ob['Email'] ?? "";
    senha = ob['Senha'] ?? "";
    bio = ob['Bio'] ?? "";
  }
}
