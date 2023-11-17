import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomWidget extends StatelessWidget {
  String text;

  CustomWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 80,
        color: Colors.grey,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
