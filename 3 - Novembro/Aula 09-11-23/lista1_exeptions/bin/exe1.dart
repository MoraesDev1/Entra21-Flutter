import 'dart:io';

List<int> listaDeNumeros = [];
void main() {
  try {
    while (true) {
      print('Digite um número inteiro');
      int numero = int.parse(stdin.readLineSync()!);
      listaDeNumeros.add(numero);
    }
  } catch (e) {
    print(listaDeNumeros);
  }
}
