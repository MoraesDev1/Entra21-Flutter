import 'package:app4/custom_container.dart';
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
        backgroundColor: Colors.blue,
        title: const Text(
          'Meu App 4',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: [Expanded(child: CustomContainer(text: 'Linha 1'))]),
          Row(children: [
            Expanded(flex: 1, child: CustomContainer(text: 'Lado 1')),
            Expanded(flex: 2, child: CustomContainer(text: 'Lado 2')),
          ]),
          Row(children: [Expanded(child: CustomContainer(text: 'Linha 3'))]),
        ],
      ),
    );
  }
}
