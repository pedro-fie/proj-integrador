import 'dart:js';

import 'package:app/Models/InputForm.dart';
import 'package:app/Telas/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Models/DadosLogin.dart';

Login _login = Login();

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Cadastro(),
    );
  }
}

class _Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<_Cadastro> {
  final _formKey = GlobalKey<FormState>();

  String? validarNome(value) {
    if (value == null || value.isEmpty) {
      return "Nome não pode ser vazio";
    }
    return null;
  }

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

  String? validarRepetirSenha(value) {
    if (value == null || value != _login.senha) {
      return "Senhas diferentes";
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
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            Input("Nome", EdgeInsets.only(top: distanciaY),
                (e) => _login.nome = e, validarNome),
            //Nome de Usuario
            Input("Nome de Usuário", EdgeInsets.only(top: distanciaY),
                (e) => _login.login = e, (p0) => null),
            //Email
            Input("Email", EdgeInsets.only(top: distanciaY),
                (e) => _login.email = e, validarEmail),
            //Senha
            Input("Senha", EdgeInsets.only(top: distanciaY),
                (e) => _login.senha = e, validarSenha,
                password: true),
            //Confirmar Senha
            Input("Confirmar Senha", EdgeInsets.only(top: distanciaY),
                (e) => {_login.senhaRepetida}, validarRepetirSenha,
                password: true),
            //Botao Casdastrar
            ElevatedButton(
              onPressed: () => {
                if (_formKey.currentState!.validate())
                  {
                    _login.Registrar(),
                    Navigator.pop(context),
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaLogin()),
                    )
                  }
              },
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
