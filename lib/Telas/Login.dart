import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../DadosLogin.dart';

Login _login = Login();

class TelaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2C3639),
      transformAlignment: Alignment.center,
      alignment: Alignment.center,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),
          SvgPicture.asset(
            'assets/images/unlock.svg',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),

          //Label Login
          Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width * 0.7,
            child: const Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          //Campo Login
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color(0xFFDCD7C9),
            ),
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextField(
              onChanged: (e) => {_login.login = e},
              decoration: InputDecoration(
                hintText: "Login",
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
              onChanged: (e) => {_login.login = e},
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Senha",
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
          //Esqueceu a senha
          Container(
            alignment: Alignment.centerRight,
            width: MediaQuery.of(context).size.width * 0.7,
            child: ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                elevation: 0,
                padding: const EdgeInsets.all(0),
              ),
              child: const Text(
                "Esqueceu a senha?",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),
          //Botao logar
          ElevatedButton(
            onPressed: () => {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width * 0.7,
                  MediaQuery.of(context).size.height * 0.1),
              fixedSize: Size(MediaQuery.of(context).size.width * 0.7,
                  MediaQuery.of(context).size.height * 0.1),
              backgroundColor: const Color(0xFFA27B5C),
            ),
            child: const Text("Login"),
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
                  "Não tem uma conta?",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                    padding: const EdgeInsets.all(0),
                  ),
                  child: const Text(
                    "Cadastre-se",
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
    );
  }
}
