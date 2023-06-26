import 'dart:html';
import 'dart:typed_data';

import 'package:app/Database/Database.dart';
import 'package:app/Models/DadosLogin.dart';
import 'package:app/Models/SideBar.dart';
import 'package:app/Models/TopBar.dart';
import 'package:flutter/material.dart';
import '../Models/Card.dart';
import 'package:app/Storage/Storage.dart';

class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C3639),
      appBar: getTopBar('Receitas', [
        IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.search),
        ),
      ]),
      drawer: getDrawer(context),
      body: _TelaP(),
    );
  }
}

class _TelaP extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TelaPState();
}

class _TelaPState extends State<_TelaP> {
  List<Cartao> cards = <Cartao>[];

  _TelaPState() {
    Database db = Database();
    db.receitas
        .Get(null,
            isNotEqualTo: Storage.getStorage("usuarioId"), field: "UsuarioId")
        .then(
          (value) => {
            if (value.isNotEmpty)
              {
                value.forEach(
                  (e) {
                    cards.add(Cartao(e.id, e.titulo, e.descricao, e.curtida,
                        e.usuarioId, e.imagem));
                  },
                ),
                setState(() {}),
              }
          },
        );
  }

  List<Widget> getCards(BuildContext context) {
    List<Widget> w = <Widget>[];
    for (var e in cards) {
      w.add(e.createCard(context));
    }
    return w;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      child: Column(
        children: getCards(context),
      ),
    );
  }
}
