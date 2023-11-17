import 'formageometrica.dart';

class Circulo implements FormaGeometrica {
  double raio;

  Circulo({required this.raio});

  @override
  double calcArea() => (raio * raio) * 3.14;

  @override
  double calcPerimetro() => 2 * 3.14 * raio;
}
