import 'package:aula/loginpage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    result() async {
      final myObj = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(
            texto: 'Conteúdo enviado de Home para Login',
          ),
        ),
      );
      print(myObj);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Home Page'),
      ),
      backgroundColor: Colors.amber,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  result();
                },
                child: const Text('Ir para LoginPage'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
