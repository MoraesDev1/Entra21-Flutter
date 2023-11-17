// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  void Function()? onPressed;
  Widget child;

  CustomButtom({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
        disabledBackgroundColor: const Color.fromARGB(125, 255, 193, 7),
        padding: const EdgeInsets.all(30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
