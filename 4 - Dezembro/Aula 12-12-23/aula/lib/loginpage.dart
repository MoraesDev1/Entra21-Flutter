import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  String texto;

  LoginPage({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Login Page'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Text(texto),
              ),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context, 'Meu Objeto'),
                  child: const Text('Voltar para Home'))
            ],
          ),
        ],
      ),
    );
  }
}
