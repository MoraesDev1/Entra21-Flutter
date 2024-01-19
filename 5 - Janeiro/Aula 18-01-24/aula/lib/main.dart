import 'package:aula/page1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: const Page1(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
    ),
  );
}
