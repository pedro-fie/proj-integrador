import 'dart:html';
import 'dart:typed_data';

import 'package:app/Models/SideBar.dart';
import 'package:app/Models/TopBar.dart';
import 'package:flutter/material.dart';
import '../Models/Card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TelaPrincipal extends StatelessWidget {
  Widget createCard(Cartao c, BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.height * .7,
      child: Column(
        children: [
          if (c.image != null)
            SvgPicture.memory(
              c.image ?? Uint8List(0),
              height: MediaQuery.of(context).size.height * .2,
              fit: BoxFit.cover,
            ),
          if (c.image == null)
            Container(
              height: MediaQuery.of(context).size.height * .2,
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: Colors.white),
              child: const Text('Error'),
            ),
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(color: Color(0xFFA27B5C)),
            child: Text(c.text),
          )
        ],
      ),
    );
  }

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
      body: Column(
        children: [],
      ),
    );
  }
}
