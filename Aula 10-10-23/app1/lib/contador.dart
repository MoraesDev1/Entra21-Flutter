import 'package:flutter/material.dart';

class Contador extends StatelessWidget {
  final int contador;
  final Color corNumero;

  const Contador({super.key, required this.contador, required this.corNumero});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(80),
      child: Center(
        child: Text(
          "$contador",
          style: TextStyle(
            fontSize: 70,
            color: corNumero,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
