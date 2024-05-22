import 'package:flutter/material.dart';
import '../widgets/AppBarPersonalizado.dart';

class GerenciamentoDeReserva extends StatefulWidget {
  const GerenciamentoDeReserva({Key? key}) : super(key: key);

  @override
  State<GerenciamentoDeReserva> createState() => _GerenciamentoDeReservaState();
}

class _GerenciamentoDeReservaState extends State<GerenciamentoDeReserva> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPersonalizado(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF8DCBC8),
              ),
              child: Text(
                'Outras Páginas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Gen. Reservas'),
              onTap: () {
                // Adicione funcionalidade para o Botão 1
              },
            ),
            ListTile(
              title: Text('His. Reservas'),
              onTap: () {
                // Adicione funcionalidade para o Botão 2
              },
            ),
            // Adicione mais widgets ListTile para botões adicionais, se necessário
          ],
        ),
      ),
    );
  }
}
