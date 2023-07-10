import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:app/Database/Database.dart';
import 'package:app/Database/Dataset/Receita.dart';
import 'package:app/Models/InputForm.dart';
import 'package:app/Storage/Storage.dart';
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
  bool saving = false;
  final _formKeyAddReceita = GlobalKey<FormState>();

  void saveReceita() {
    Database db = Database();
    rec.imagem = const Base64Encoder().convert(bytes!);
    rec.usuarioId = Storage.getStorage("usuarioId");
    db.receitas.Add(rec);
  }

  Future<Uint8List> showUploadDialog() async {
    Completer completer = Completer();

    FileUploadInputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen(
      (changeEvent) {
        final file = uploadInput.files!.first;
        final reader = FileReader();

        reader.onLoadEnd.listen(
          (loadEndEvent) {
            completer.complete(reader.result as Uint8List);
          },
        );

        reader.readAsArrayBuffer(file);
      },
    );

    return await completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2C3639),
      alignment: Alignment.topCenter,
      child: Form(
        key: _formKeyAddReceita,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .03,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () async => {
                  bytes = await showUploadDialog(),
                  setState(() => {}),
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .3,
                  width: MediaQuery.of(context).size.width * .8,
                  child: bytes == null
                      ? Container(
                          color: Colors.black,
                          alignment: Alignment.center,
                          child: const Text(
                            "Clique aqui para adicionar uma imagem.",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : Image.memory(
                          bytes!,
                          fit: BoxFit.contain,
                        ),
                ),
              ),
            ),
            Input(
              "Titulo",
              EdgeInsets.only(top: MediaQuery.of(context).size.height * .03),
              (e) => rec.titulo = e,
              (e) => (e?.isNotEmpty ?? false) ? null : "Adicione um Titulo.",
              length: 50,
            ),
            Input(
              "Descricao",
              EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * .03,
                top: MediaQuery.of(context).size.height * .02,
              ),
              (e) => rec.descricao = e,
              (e) => null,
              height: MediaQuery.of(context).size.height * .2,
              type: TextInputType.multiline,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.03),
              child: ElevatedButton(
                onPressed: () => {
                  if (bytes != null &&
                      (bytes?.isNotEmpty ?? false) &&
                      _formKeyAddReceita.currentState!.validate() &&
                      !saving)
                    {
                      saving = true,
                      saveReceita(),
                      Navigator.pop(context),
                    }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.7,
                      MediaQuery.of(context).size.height * 0.1),
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.7,
                      MediaQuery.of(context).size.height * 0.1),
                  backgroundColor: !saving
                      ? const Color(0xFFA27B5C)
                      : const Color.fromARGB(255, 172, 171, 171),
                ),
                child: const Text("Adicionar Receita"),
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                if (!saving) Navigator.pop(context),
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * 0.7,
                    MediaQuery.of(context).size.height * 0.1),
                fixedSize: Size(MediaQuery.of(context).size.width * 0.7,
                    MediaQuery.of(context).size.height * 0.1),
                backgroundColor: !saving
                    ? const Color(0xFFA27B5C)
                    : const Color.fromARGB(255, 172, 171, 171),
              ),
              child: const Text("Voltar"),
            ),
          ],
        ),
      ),
    );
  }
}
