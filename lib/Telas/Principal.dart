import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TelaPrincipal extends StatelessWidget {
  Widget makeButtom(IconData icone, String texto) {
    return Row(
      children: [
        Icon(icone),
        ElevatedButton(
          onPressed: () => {},
          child: Text(texto),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C3639),
      appBar: AppBar(
        title: const Text('Receitas'),
        backgroundColor: const Color(0xFF2C3639),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => {
            if (Scaffold.of(context).isDrawerOpen)
              {
                Scaffold.of(context).openDrawer(),
              }
            else
              {
                Scaffold.of(context).closeDrawer(),
              }
          },
        ),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            makeButtom(Icons.person, 'Perfil'),
            makeButtom(Icons.star, 'Favoritos'),
            makeButtom(Icons.playlist_add_rounded, 'Adicionar Receita'),
          ],
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
