import 'dart:io';

void main() {
  try {
    nivel1();
  } catch (e) {
    print('Resultado inválido');
  }
}

nivel1() {
  try {
    nivel2();
  } on FormatException catch (e) {
    throw CustomException('Entrada inválida');
  }
}

nivel2() {
  print('Informe um número inteiro');
  int numero1 = int.parse(stdin.readLineSync()!);
  print('Informe um número inteiro');
  int numero2 = int.parse(stdin.readLineSync()!);
  int resultado = numero1 ~/ numero2;
  print('Resultado = $resultado');
}

class CustomException implements Exception {
  String cause;
  CustomException(this.cause);
}
