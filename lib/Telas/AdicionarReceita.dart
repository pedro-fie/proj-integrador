import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:app/Database/Database.dart';
import 'package:app/Database/Dataset/Receita.dart';
import 'package:app/Models/InputForm.dart';
import 'package:app/Telas/Perfil.dart';
import 'package:flutter/material.dart';

Receita rec = Receita();

class TelaAdicionarReceita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddReceita(),
    );
  }
}

class AddReceita extends StatefulWidget {
  @override
  _AddReceita createState() => _AddReceita();
}

class _AddReceita extends State<AddReceita> {
  Uint8List? bytes;

  void saveReceita() {
    Database db = Database();
    rec.imagem = const Base64Encoder().convert(bytes!);
    db.receitas.Add(rec);
  }

  static Future<Uri> showUploadDialog() async {
    Completer completer = Completer();

    FileUploadInputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen(
      (changeEvent) {
        final file = uploadInput.files!.first;
        final reader = FileReader();

        reader.onLoadEnd.listen(
          (loadEndEvent) async {
            completer.complete();
          },
        );

        reader.readAsDataUrl(file);
      },
    );

    return await completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => {FileUploadInputElement()},
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width * .8,
              child: bytes == null
                  ? Container(
                      color: Colors.black,
                    )
                  : Image.memory(
                      bytes!,
                      fit: BoxFit.contain,
                    ),
            ),
          ),
          Input(
              "Titulo",
              EdgeInsets.only(top: MediaQuery.of(context).size.height * .03),
              (e) => rec.titulo = e,
              (e) => null),
          Input(
              "Descricao",
              EdgeInsets.only(top: MediaQuery.of(context).size.height * .03),
              (e) => rec.descricao = e,
              (e) => null),
          ElevatedButton(
            onPressed: () => {
              saveReceita(),
              Navigator.pop(context),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PerfilTela()),
              ),
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width * 0.7,
                  MediaQuery.of(context).size.height * 0.1),
              fixedSize: Size(MediaQuery.of(context).size.width * 0.7,
                  MediaQuery.of(context).size.height * 0.1),
              backgroundColor: const Color(0xFFA27B5C),
            ),
            child: const Text("Adicionar Receita"),
          ),
        ],
      ),
    );
  }
}
