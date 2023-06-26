import 'package:app/Database/Dataset/Dataset.dart';
import 'package:app/Database/Dataset/TableBase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Receita extends TableBase {
  Receita({id = ""}) : super(id);

  @override
  void unMap(Map<String, dynamic>? ob, String id) {
    if (ob == null) return;
    this.id = id;
    curtida = ob["Curtida"] ?? 0;
    descricao = ob["Descricao"] ?? "";
    imagem = ob["Imagem"] ?? "";
    usuarioId = ob["UsuarioId"] ?? "";
    titulo = ob["Titulo"] ?? "";
  }

  @override
  Object getObject() {
    return this;
  }

  int curtida = 0;
  String descricao = "";
  String imagem = "";
  String usuarioId = "";
  String titulo = "";

  @override
  Map<String, dynamic> toMap() {
    return {
      'Curtida': curtida,
      'Descricao': descricao,
      'Imagem': imagem,
      'UsuarioId': usuarioId,
      "Titulo": titulo,
    };
  }
}
