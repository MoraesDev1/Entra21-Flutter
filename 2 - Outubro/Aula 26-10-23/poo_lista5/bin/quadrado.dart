import 'formageometrica.dart';

class Quadrado implements FormaGeometrica {
  double lado;

  Quadrado({required this.lado});

  @override
  double calcArea() => lado * lado;

  @override
  double calcPerimetro() => lado * 4;
}
