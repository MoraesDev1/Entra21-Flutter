import 'package:aula/page2.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.grey[200],
            ),
          ),
          child: Text(
            'Perfil',
            style: TextStyle(color: Colors.purple[300]),
          ),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Page2(),
            ),
          ),
        ),
      ),
    );
  }
}
