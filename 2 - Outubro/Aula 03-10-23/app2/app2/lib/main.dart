import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'App 2',
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.purple,
        width: 393,
        height: 150,
        alignment: Alignment.center,
        child: const Text(
          'Olá',
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
