import 'package:flutter/material.dart';

class PageNovo extends StatelessWidget {
  const PageNovo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Novo'),
      ),
    );
  }
}
