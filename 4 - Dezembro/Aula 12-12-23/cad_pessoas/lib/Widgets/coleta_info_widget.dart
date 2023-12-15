import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ColetaInfo extends StatelessWidget {
  late String descricao;
  TextEditingController controller;
  ColetaInfo({super.key, required this.descricao, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
