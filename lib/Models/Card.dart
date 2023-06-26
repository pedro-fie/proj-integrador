import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class Cartao {
  Uint8List? image;
  String titulo = "";
  String id = "";
  String sobre = "";
  int curtida = 0;
  String usuarioId;

  Cartao(this.id, this.titulo, this.sobre, this.curtida, this.usuarioId,
      String img) {
    image = const Base64Decoder().convert(img);
  }

  Widget createCard(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * .9,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          if (image != null)
            Image.memory(
              image ?? Uint8List(0),
              height: MediaQuery.of(context).size.height * .2,
              fit: BoxFit.contain,
            ),
          if (image == null)
            Container(
              height: MediaQuery.of(context).size.height * .2,
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: Colors.white),
              child: const Text('Error'),
            ),
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xFFA27B5C),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              titulo,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
