import 'package:cad_pessoas/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: const Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
    ),
  );
}
