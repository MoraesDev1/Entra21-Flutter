import 'real.dart';

void main() {
  Real real = Real();
  real.valor = 10.878028080;

  print(real.toInt());

  print(real.paraString());

  print(real.paraStringAsFixed(3));

  real.deString('23');
  print(real.valor);
}
