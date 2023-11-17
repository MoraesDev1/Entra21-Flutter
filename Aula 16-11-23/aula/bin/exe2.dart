import 'dart:io';

void main() {
  pedeNumRetornaInt().then(
    (value) {
      print('Número válido');
    },
  ).catchError(
    (e) {
      if (e is CustomException) {
        print(e.cause);
      }
    },
  );
}

Future<int> pedeNumRetornaInt() async {
  print('Digite um número:');
  String numero = stdin.readLineSync()!;
  try {
    int numeroInteiro = int.parse(numero);
    return numeroInteiro;
  } catch (e) {
    throw CustomException('Número inválido');
  }
}

class CustomException implements Exception {
  String cause;
  CustomException(this.cause);
}
