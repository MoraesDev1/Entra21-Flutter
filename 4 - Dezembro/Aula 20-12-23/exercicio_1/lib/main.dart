import 'package:flutter/material.dart';
import 'package:shared_preferences_exercicio_1/Pages/homepage.dart';

void main() {
  runApp(
    MaterialApp(
      home: const HomePage(),
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
    ),
  );
}
