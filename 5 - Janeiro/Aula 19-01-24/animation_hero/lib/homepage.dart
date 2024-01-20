// ignore_for_file: must_be_immutable

import 'package:animation_hero/carro.dart';
import 'package:animation_hero/detailspage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Carro> _carros = [
    Carro(heroTag: 'C1', url: 'assets/image/fusca.png', descricao: 'Fusca'),
    Carro(heroTag: 'C2', url: 'assets/image/premio.png', descricao: 'Premio'),
    Carro(heroTag: 'C3', url: 'assets/image/caravan.png', descricao: 'Caravan'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Hero'),
        backgroundColor: Colors.deepPurple[500],
      ),
      body: Column(
        children: [
          for (final item in _carros)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(
                      carro: item,
                    ),
                  ),
                );
              },
              child: Hero(
                tag: item.heroTag,
                child: Image.asset(
                  item.url,
                  width: 200,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
