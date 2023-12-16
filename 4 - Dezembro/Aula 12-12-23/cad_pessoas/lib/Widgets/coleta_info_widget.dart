import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ColetaInfo extends StatelessWidget {
  final String hint;
  final String label;
  TextEditingController controller;
  ColetaInfo(
      {super.key,
      required this.label,
      required this.hint,
      required this.controller});

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
                  decoration: InputDecoration(
                    label: Text(label),
                    hintText: hint,
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
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
