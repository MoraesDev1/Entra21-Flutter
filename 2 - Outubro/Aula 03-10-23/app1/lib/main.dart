import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Meu App'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Hello World',
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 40,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
