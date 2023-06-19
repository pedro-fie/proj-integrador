import 'package:app/Telas/Cadastro.dart';
import 'package:app/Telas/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Iniciar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        transformAlignment: Alignment.center,
        alignment: Alignment.center,
        color: const Color(0xFF2C3639),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            SvgPicture.asset(
              'assets/images/cooking.svg',
              width: MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.height * .4,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .7,
              child: const Text(
                // ignore: prefer_interpolation_to_compose_strings
                "Com uma ampla variedade de receitas deliciosas, " +
                    "desde pratos principais até sobremesas, o app oferece um " +
                    "acervo completo para você criar novas opções na cozinha. " +
                    "Com a facilidade de ter as receitas sempre à mão, você poderá " +
                    "preparar pratos incríveis em poucos minutos, surpreendendo a todos " +
                    "com o seu talento culinário.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cadastro()),
                )
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * 0.7,
                    MediaQuery.of(context).size.height * 0.1),
                fixedSize: Size(MediaQuery.of(context).size.width * 0.7,
                    MediaQuery.of(context).size.height * 0.1),
                backgroundColor: const Color(0xFFA27B5C),
              ),
              child: const Text("Iniciar"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            ElevatedButton(
              onPressed: () => {
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
                "Já tem uma conta? Faça o login",
                style: TextStyle(
                  color: Color(0xFFDCD7C9),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
