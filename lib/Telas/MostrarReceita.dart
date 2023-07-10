import 'dart:convert';
import 'dart:typed_data';

import 'package:app/Database/Database.dart';
import 'package:app/Database/Dataset/Receita.dart' as r;
import 'package:app/Models/Card.dart';
import 'package:flutter/material.dart';

class TelaReceita extends StatelessWidget {
  final Cartao _card;
  const TelaReceita(this._card, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C3639),
      body: Receita(_card),
    );
  }
}

class Receita extends StatefulWidget {
  final Cartao _card;
  const Receita(this._card, {super.key});

  @override
  _Receita createState() => _Receita(_card);
}

class _Receita extends State<Receita> {
  final Cartao _card;

  _Receita(this._card);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: Image.memory(
              _card.image!,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .03),
            child: Text(
              _card.titulo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 35,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .03),
            child: Text(
              _card.sobre,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
