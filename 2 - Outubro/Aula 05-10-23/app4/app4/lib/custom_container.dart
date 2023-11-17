import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  String text;
  EdgeInsets margin;
  double height;
  Color containerColor;
  Color textColor;
  double fontSize;

  CustomContainer({
    super.key,
    required this.text,
    this.margin = const EdgeInsets.all(10),
    this.height = 50,
    this.containerColor = Colors.grey,
    this.textColor = Colors.white,
    this.fontSize = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      color: containerColor,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
