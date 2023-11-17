import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  _click() {
    print('Click');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aula 4'),
      ),
      body: Center(
        // ignore: sized_box_for_whitespace
        child: Container(
          width: 100,
          height: 50,
          child: ElevatedButton(
            onPressed: _click,
            child: const Text(
              'Press',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
