import 'package:app/Database/Database.dart';
import 'package:app/Models/Card.dart';
import 'package:app/Storage/Storage.dart';
import 'package:flutter/material.dart';

import '../Models/SideBar.dart';
import '../Models/TopBar.dart';

class PerfilTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C3639),
      appBar: getTopBar('Perfil', null),
      drawer: getDrawer(context),
      body: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Image.asset(
              "images/perfil.png",
              width: MediaQuery.of(context).size.width * .3,
              height: MediaQuery.of(context).size.height * .2,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            Text(
              Storage.getStorage<String>("nomeUsuario") ?? "Nome Usuario",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Biografia:",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              Storage.getStorage<String>("biografia") ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            _Perfil()
          ],
        ),
      ),
    );
  }
}

class _Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<_Perfil> {
  List<Cartao> cards = [];

  _PerfilState() {
    Database db = Database();
    db.receitas
        .Get(null,
            isEqualTo: Storage.getStorage<String>("usuarioId"),
            field: "UsuarioId")
        .then(
          (value) => {
            if (value.isNotEmpty)
              {
                for (var v in value)
                  {
                    cards.add(Cartao(v.id, v.titulo, v.descricao, v.curtida,
                        v.usuarioId, v.imagem))
                  },
                setState(() => {}),
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
