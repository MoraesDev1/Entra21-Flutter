// ignore_for_file: library_private_types_in_public_api

import 'package:app1/contador.dart';
import 'package:app1/custombuttom.dart';
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
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int contador = 0;

  void increment() {
    setState(() {
      contador++;
    });
  }

  void decrement() {
    setState(() {
      contador--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: const Text("Contador de Pessoas"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: contador == 10
                ? const AssetImage('assets/images/fundoquando10.jpg')
                : const AssetImage('assets/images/fundoPadrao.jpg'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Contador(
                contador: contador,
                corNumero: contador == 10 ? Colors.red : Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButtom(
                  onPressed: contador > 0 ? decrement : null,
                  child: const Icon(Icons.remove),
                ),
                CustomButtom(
                  onPressed: contador < 10 ? increment : null,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
