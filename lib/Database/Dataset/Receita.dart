import 'package:app/Database/Dataset/Dataset.dart';
import 'package:app/Database/Dataset/TableBase.dart';

class Receita extends TableBase {
  Receita({id = ""}) : super(id);

  @override
  void unMap(Map<String, dynamic>? ob) {
    if (ob == null) return;
    curtida = ob["curtida"];
    descricao = ob["descricao"];
    imagem = ob["imagem"];
    usuarioId = ob["usuarioId"];
  }

  int curtida = 0;
  String descricao = "";
  String imagem = "";
  String usuarioId = "";

  @override
  Map<String, dynamic> toMap() {
    return {
      'curtida': curtida,
      'descricao': descricao,
      'imagem': imagem,
      'usuarioId': usuarioId,
    };
  }
}
