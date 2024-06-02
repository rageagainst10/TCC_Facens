import 'package:ecoparkdesktop/pages/AtribuirPermissao.dart';
import 'package:ecoparkdesktop/pages/atualizarDados.dart';
import 'package:ecoparkdesktop/pages/cadastroFuncionario.dart';
import 'package:ecoparkdesktop/pages/gerenciamentoDeReservas.dart';
import 'package:ecoparkdesktop/pages/cadastroLocalizacao.dart';
import 'package:ecoparkdesktop/pages/login.dart';
import 'package:ecoparkdesktop/widgets/AppBarPersonalizado.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../services/auth_service.dart';
import '../services/storage_service.dart';

class GerenciamentoDePremios extends StatelessWidget {
  const GerenciamentoDePremios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeGerenciamentoDePremios(),
    );
  }
}

class HomeGerenciamentoDePremios extends StatefulWidget {
  const HomeGerenciamentoDePremios({Key? key}) : super(key: key);

  @override
  _HomeGerenciamentoDePremiosState createState() =>
      _HomeGerenciamentoDePremiosState();
}

class _HomeGerenciamentoDePremiosState
    extends State<HomeGerenciamentoDePremios> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();
  final TextEditingController valorController = TextEditingController();
  final TextEditingController validadeController = TextEditingController();
  final TextEditingController imagemController = TextEditingController();

  final StorageService _storageService = getIt<StorageService>();
  final AuthService _authService =
  getIt<AuthService>(); // Obter instância do AuthService

  String? _userRole;

  @override
  void initState() {
    super.initState();
    _getUserRole(); // Carrega o papel do usuário ao iniciar a tela
  }
  Future<void> _getUserRole() async {
    try {
      final userRole = await _storageService.getUserRole();
      setState(() {
        _userRole = userRole;
      });
    } catch (e) {
      // Tratar erro ao obter o papel do usuário
      setState(() {
      });
      print('Erro ao obter papel do usuário: $e');
    }
  }

  List<Map<String, String>> premios = [];

  @override
  void dispose() {
    nomeController.dispose();
    quantidadeController.dispose();
    valorController.dispose();
    validadeController.dispose();
    imagemController.dispose();
    super.dispose();
  }

  void adicionarProduto() {
    String nome = nomeController.text;
    String quantidade = quantidadeController.text;
    String valor = valorController.text;
    String validade = validadeController.text;
    String imagem = imagemController.text;

    if (nome.isNotEmpty &&
        quantidade.isNotEmpty &&
        valor.isNotEmpty &&
        validade.isNotEmpty &&
        imagem.isNotEmpty) {
      setState(() {
        premios.add({
          'nome': nome,
          'quantidade': quantidade,
          'valor': valor,
          'validade': validade,
          'imagem': imagem,
        });
      });

      // Limpar os campos de texto após adicionar
      nomeController.clear();
      quantidadeController.clear();
      valorController.clear();
      validadeController.clear();
      imagemController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, preencha todos os campos.')),
      );
    }
  }

  void excluirProduto(int index) {
    setState(() {
      premios.removeAt(index);
    });
  }

  void limparTudo() {
    setState(() {
      premios.clear();
    });
    // Limpar todos os campos de texto
    nomeController.clear();
    quantidadeController.clear();
    valorController.clear();
    validadeController.clear();
    imagemController.clear();
    print("Todos os campos foram limpos.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPersonalizado(
        text:
            'Gerenciamento de premios', // Passando o texto desejado para o AppBarPersonalizado
      ),
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
              title: Text('Gerenciamento de reservas'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => GerenciamentoDeReserva()),
                );
              },
            ),
            FutureBuilder<String?>(
              future: _storageService.getUserRole(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // Indicador de carregamento
                } else if (snapshot.hasError) {
                  return Text('Erro ao carregar o papel do usuário: ${snapshot.error}'); // Mensagem de erro
                } else {
                  _userRole = snapshot.data; // Atribui o papel do usuário
                  return _userRole != 'Employee' && _userRole != 'PlatformAdministrator'
                      ? ListTile(
                    title: Text('Cadastro de Localização'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => CadastroDeLocalizacao()),
                      );
                    },
                  )
                      : Container();
                }
              },
            ),
            FutureBuilder<String?>(
              future: _storageService.getUserRole(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // Indicador de carregamento
                } else if (snapshot.hasError) {
                  return Text('Erro ao carregar o papel do usuário: ${snapshot.error}'); // Mensagem de erro
                } else {
                  _userRole = snapshot.data; // Atribui o papel do usuário
                  return _userRole != 'PlatformAdministrator'
                      ? ListTile(
                    title: Text('Cadastro de Funcionario'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => CadastroDeFuncionario()),
                      );
                    },
                  )
                      : Container();
                }
              },
            ),//Insert Funcionario
            FutureBuilder<String?>(
              future: _storageService.getUserRole(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // Indicador de carregamento
                } else if (snapshot.hasError) {
                  return Text('Erro ao carregar o papel do usuário: ${snapshot.error}'); // Mensagem de erro
                } else {
                  _userRole = snapshot.data; // Atribui o papel do usuário
                  return _userRole != 'PlatformAdministrator'
                      ? ListTile(
                    title: Text('Atribuir Permissão'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => AtribuirPermissao()),
                      );
                    },
                  )
                      : Container();
                }
              },
            ),//Atribuir Permissao
            ListTile(
              title: Text('Atualizar Dados'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AtualizarDados()),
                );
              },
            ),
            ListTile(
              title: Text('Sair'),
              onTap: () async {
                await _authService.logout();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nomeController,
                decoration: InputDecoration(
                  labelText: "Nome do prêmio",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF8DCBC8)),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: quantidadeController,
                      decoration: InputDecoration(
                        labelText: "Quantidade disponível",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF8DCBC8)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: valorController,
                      decoration: InputDecoration(
                        labelText: "Valor do prêmio",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF8DCBC8)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: validadeController,
                      decoration: InputDecoration(
                        labelText: "Validade do prêmio",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF8DCBC8)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextField(
                controller: imagemController,
                decoration: InputDecoration(
                  labelText: "URL da imagem",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF8DCBC8)),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: adicionarProduto,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 45),
                  side: BorderSide(color: Color(0xFF8DCBC8)),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                child: Text("Adicionar Produto"),
              ),
              SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: premios.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      leading: premios[index]['imagem']!.isNotEmpty
                          ? Image.network(
                              premios[index]['imagem']!,
                              width: 50,
                              height: 50,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.error);
                              },
                            )
                          : Icon(Icons.image),
                      title: Text(premios[index]['nome']!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Quantidade: ${premios[index]['quantidade']}"),
                          Text("Valor: ${premios[index]['valor']}"),
                          Text("Validade: ${premios[index]['validade']}"),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          excluirProduto(index);
                        },
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Você possui ${premios.length} prêmios adicionados"),
                  Spacer(),
                  ElevatedButton(
                    onPressed: limparTudo,
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 45),
                      side: BorderSide(color: Color(0xFF8DCBC8)),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    child: Text("Limpar tudo"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const GerenciamentoDePremios());
}
