// ignore_for_file: must_be_immutable

import 'package:animation_hero/carro.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required Carro carro});

  late Carro carro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
        backgroundColor: Colors.deepPurple[500],
      ),
      body: Hero(
        tag: carro.heroTag,
        child: Image.asset(carro.url),
      ),
    );
  }
}
