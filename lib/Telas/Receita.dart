import 'dart:typed_data';

import 'package:app/Models/Card.dart';
import 'package:app/Models/SideBar.dart';
import 'package:app/Models/TopBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Receita extends StatelessWidget {
  final Cartao cartao;
  Receita(this.cartao, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getTopBar(cartao.text, [
        IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.star_border),
        ),
      ]),
      drawer: getDrawer(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SvgPicture.memory(
              cartao.image ?? Uint8List(0),
              height: MediaQuery.of(context).size.height * .2,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 2),
            child: Text('Sobre'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(cartao.sobre),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 2),
            child: Text('Mode de Preparo'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(cartao.preparo),
          ),
        ],
      ),
    );
  }
}
