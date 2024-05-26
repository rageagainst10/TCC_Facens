
import 'package:ecoparkdesktop/pages/cadastro.dart';
import 'package:ecoparkdesktop/pages/gerenciamentoDeReservas.dart';
import 'package:ecoparkdesktop/widgets/CaixaDeTextoPersonalizado.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: const Color(0xFFF3F9F8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 400,
                    width: 400,
                    child: Image.asset("assets/images/logoEcoPark1.png"),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                      children: [
                        TextSpan(
                          text: "Reserve, Conserve, Descubra\n",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "Sua Vaga, Sua Pegada",
                          style: TextStyle(
                            color: Color(0xFF8DCBC8),
                          ),
                        ),
                        TextSpan(
                          text: ", Sua\n",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "Eco",
                          style: TextStyle(
                            color: Color(0xFF8DCBC8),
                          ),
                        ),
                        TextSpan(
                          text: "Park",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  SizedBox(
                    height: 200,
                    width: 400,
                    child: Image.asset("Assets/Images/text.png"),
                  ),
                  const SizedBox(height: 20),
                  CaixaDeTextoPersonalizado(
                    hintText: 'E-mail',
                  ),
                  const SizedBox(height: 20),
                  CaixaDeTextoPersonalizado(
                    hintText: 'Senha',
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 350,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => GerenciamentoDeReserva()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  Color(0xFF8DCBC8), // Cor correta
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Cadastro()),
                );
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "Nao possui uma conta? ",
                        style: TextStyle(
                          color: Color(0xFF5C5C5C),
                        ),
                      ),
                      TextSpan(
                        text: "Cadastre-se",
                        style: TextStyle(
                          color: Color(0xFF8DCBC8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

