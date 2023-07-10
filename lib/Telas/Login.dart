import 'dart:async';
import 'dart:js';

import 'package:app/Storage/Storage.dart';
import 'package:app/Telas/Cadastro.dart';
import 'package:app/Telas/Principal.dart';
import 'package:app/Telas/RecuperarSenha.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Models/DadosLogin.dart';
import '../Models/InputForm.dart';

Login _login = Login();

class TelaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool erro = false;

  String? validarEmail(value) {
    if (value == null || value.isEmpty) {
      return "Email não pode ser vazio";
    }
    if (!value.contains('@') || !value.contains('.')) {
      return "Formato de email inválido";
    }
    return null;
  }

  String? validarSenha(value) {
    if (value == null || value.length < 5) {
      return "Senha não pode ter menos de 5 caracteres";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double distanciaY = MediaQuery.of(context).size.height * 0.03;
    return Form(
      key: _formKey,
      child: Container(
        color: const Color(0xFF2C3639),
        transformAlignment: Alignment.center,
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: distanciaY),
              child: SvgPicture.asset(
                'assets/images/unlock.svg',
                width: MediaQuery.of(context).size.width * .7,
                height: MediaQuery.of(context).size.height * .3,
                fit: BoxFit.cover,
              ),
            ),
            if (erro)
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .02,
                ),
                child: const Text(
                  "Usuário ou senha incorretos.",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            Input(
              "Email",
              EdgeInsets.only(top: distanciaY),
              (e) => {_login.login = e},
              validarEmail,
            ),
            Input(
              "Senha",
              EdgeInsets.only(top: distanciaY),
              (e) => {_login.senha = e},
              validarSenha,
              password: true,
            ),
            //Esqueceu a senha
            Container(
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RecuperarSenha()),
                  )
                },
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
              onPressed: () => {
                if (_formKey.currentState!.validate())
                  {
                    _login.CheckLogin().then(
                      (value) => {
                        if (value == true)
                          {
                            Navigator.pop(context),
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TelaPrincipal(),
                              ),
                            ),
                          }
                        else
                          {
                            erro = true,
                            setState(() => {}),
                          }
                      },
                    ),
                  }
              },
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
                    onPressed: () => {
                      Navigator.pop(context),
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Cadastro()),
                      )
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Text(
                      " Cadastre-se",
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
