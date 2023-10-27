import 'formageometrica.dart';

class Retangulo implements FormaGeometrica {
  double base;
  double altura;

  Retangulo({required this.base, required this.altura});

  @override
  double calcArea() => base * altura;

  @override
  double calcPerimetro() => (base + altura) * 2;
}
