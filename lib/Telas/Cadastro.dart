import 'dart:js';

import 'package:app/Telas/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Models/DadosLogin.dart';

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF2C3639),
        transformAlignment: Alignment.center,
        alignment: Alignment.center,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            //Nome de Usuario
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width * 0.7,
              child: const Text(
                "Nome de Usuário",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            //Campo Nome de Usuario
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xFFDCD7C9),
              ),
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                onChanged: (e) => {},
                decoration: InputDecoration(
                  hintText: "Usuário",
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            //Fim Nome de Usuario
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            //Email
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width * 0.7,
              child: const Text(
                "Email",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            //Campo Email
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xFFDCD7C9),
              ),
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                onChanged: (e) => {},
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            //Fim Email
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            //Label Senha
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width * 0.7,
              child: const Text(
                "Senha",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            //Campo Senha
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xFFDCD7C9),
              ),
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                onChanged: (e) => {},
                decoration: InputDecoration(
                  hintText: "Senha",
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),

            //Label Confirmar Senha
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width * 0.7,
              child: const Text(
                "Confirmar Senha",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            //Campo Confirmar Senha
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xFFDCD7C9),
              ),
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                onChanged: (e) => {},
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Confirmar Senha",
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            //Fim Confirmar Senha
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            //Botao Casdastrar
            ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * 0.7,
                    MediaQuery.of(context).size.height * 0.1),
                fixedSize: Size(MediaQuery.of(context).size.width * 0.7,
                    MediaQuery.of(context).size.height * 0.1),
                backgroundColor: const Color(0xFFA27B5C),
              ),
              child: const Text("Cadastrar"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Já tem uma conta?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      Navigator.pop(context),
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TelaLogin()),
                      )
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Text(
                      "Faça o login",
                      style: TextStyle(
                        color: Color(0xFFDCD7C9),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
