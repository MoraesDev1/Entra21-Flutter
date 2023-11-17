import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  String? _erroEmail;
  String? _erroSenha;

  _sucessoLogin() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Login'),
        content: Text('Sucesso'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Ok')),
        ],
      ),
    );
  }

  _falhaLogin() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Login'),
        content: Text('Inválido'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Ok')),
        ],
      ),
    );
  }

  bool _validarCampos(String email, String senha) {
    _erroEmail = null;
    _erroSenha = null;
    if (email.isEmpty) {
      _erroEmail = "E-mail é obrigatório";
    }
    if (senha.isEmpty) {
      _erroSenha = "Senha é obrigatório";
    }
    return _erroEmail == null && _erroSenha == null;
  }

  bool _autenticar(String email, String senha) {
    return email == 'Gabriel ' && senha == '1234';
  }

  _click() {
    String email = _emailController.text;
    String senha = _passController.text;

    if (_validarCampos(email, senha)) {
      if (_autenticar(email, senha)) {
        _sucessoLogin();
      } else {
        _falhaLogin();
      }
    }
    setState(() {
      _emailController.clear();
      _passController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/dog.png'),
                    ),
                  ),
                ),
              ),
              const Text(
                'Pet House',
                style: TextStyle(fontSize: 40),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'Informe seu e-mail',
                    border: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(),
                    errorText: _erroEmail,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _passController,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Informe sua senha',
                    border: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(),
                    errorText: _erroSenha,
                  ),
                  obscureText: true,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                        onPressed: _click,
                        child: const Text('Login'),
                      ),
                    ),
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
