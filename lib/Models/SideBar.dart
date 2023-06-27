import 'package:app/Storage/Storage.dart';
import 'package:app/Telas/Iniciar.dart';
import 'package:app/Telas/Perfil.dart';
import 'package:app/Telas/Principal.dart';
import 'package:flutter/material.dart';

Widget _makeButtom(IconData icone, String texto, BuildContext context,
    Function(BuildContext)? T) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icone,
        color: Colors.white,
      ),
      ElevatedButton(
        onPressed: () => {
          if (T != null)
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: T(context),
              ),
            ),
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2C3639),
          shadowColor: Colors.transparent,
        ),
        child: Text(
          texto,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ],
  );
}

Widget getDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: const Color(0xFF2C3639),
    child: ListView(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      children: [
        _makeButtom(
          Icons.house,
          'Principal',
          context,
          (value) => {
            Navigator.push(
              value,
              MaterialPageRoute(
                builder: (v) => TelaPrincipal(),
              ),
            ),
          },
        ),
        _makeButtom(
          Icons.person,
          'Perfil',
          context,
          (value) => {
            Navigator.push(
              value,
              MaterialPageRoute(
                builder: (v) => PerfilTela(),
              ),
            ),
          },
        ),
        //_makeButtom(
        //    Icons.star,
        //    'Favoritos',
        //    context,
        //    (value) => {
        //          //Navigator.push(
        //          //  value,
        //          //  MaterialPageRoute(
        //          //    builder: (v) => PerfilTela(),
        //          //  ),
        //          //),
        //        },),
        _makeButtom(
          Icons.playlist_add_rounded,
          'Adicionar Receita',
          context,
          null,
        ),
        _makeButtom(
          Icons.exit_to_app,
          'Sair',
          context,
          (value) => {
            Storage.clear(),
            Navigator.popUntil(value, (route) => route.isFirst),
            Navigator.push(
              value,
              MaterialPageRoute(
                builder: (v) => Iniciar(),
              ),
            ),
          },
        ),
      ],
    ),
  );
}
