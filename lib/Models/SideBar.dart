import 'package:flutter/material.dart';

Widget _makeButtom(IconData icone, String texto, BuildContext context, var T) {
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
                builder: (context) => T(),
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
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
      children: [
        _makeButtom(Icons.person, 'Perfil', context, null),
        _makeButtom(Icons.star, 'Favoritos', context, null),
        _makeButtom(
            Icons.playlist_add_rounded, 'Adicionar Receita', context, null),
      ],
    ),
  );
}
