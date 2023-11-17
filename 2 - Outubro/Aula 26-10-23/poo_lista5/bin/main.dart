import 'dart:io';
import 'dart:web_audio';

import 'circulo.dart';
import 'formageometrica.dart';
import 'quadrado.dart';
import 'retangulo.dart';

void main() {
  String? entrada;
  int qtdDeFormas = 0;
  int? qtdEntrada;
  List<FormaGeometrica> listaDeFormas = [];

  while (qtdEntrada == null) {
    qtdEntrada = pedeForma();
    if (qtdEntrada is int) {
      qtdDeFormas = qtdEntrada;
    }

    while (qtdDeFormas > 0) {
      print(
          '\nVoce deseja criar:\n\n1 - Um Quadrado\n2 - Um Retângulo\n3 - Um Circulo\n');
      String forma = stdin.readLineSync()!;
      switch (forma) {
        case '1':
          criaQuadrado(listaDeFormas);
          qtdDeFormas--;
          break;
        case '2':
          criaRetangulo(listaDeFormas);
          qtdDeFormas--;
          break;
        case '3':
          criaCirculo(listaDeFormas);
          qtdDeFormas--;
          break;
        default:
          print('Forma inválida\n');
      }
    }

    // print('Questão A:\n');
    for (FormaGeometrica forma in listaDeFormas) {
      print('');
      if (forma is Quadrado) {
        print('Quadrado');
        print('Lado do Quadrado: ${forma.lado.toStringAsFixed(2)}');
        print(
            'Perímetro do Quadrado: ${forma.calcPerimetro().toStringAsFixed(2)}');
        print('Area do Quadrado: ${forma.calcArea().toStringAsFixed(2)}');
      } else if (forma is Retangulo) {
        print('Retangulo');
        print('Altura do Retangulo: ${forma.altura.toStringAsFixed(2)}');
        print('Base do Retangulo: ${forma.base.toStringAsFixed(2)}');
        print(
            'Perímetro do Retangulo: ${forma.calcPerimetro().toStringAsFixed(2)}');
        print('Area do Retangulo: ${forma.calcArea().toStringAsFixed(2)}');
      } else if (forma is Circulo) {
        print('Circulo');
        print('Raio do Circulo: ${forma.raio.toStringAsFixed(2)}');
        print(
            'Perímetro do Circulo: ${forma.calcPerimetro().toStringAsFixed(2)}');
        print('Area do Circulo: ${forma.calcArea().toStringAsFixed(2)}');
      }
      print('');
      // questão b)
      //   listaDeFormas.forEach((element) {
      //     print(
      //         'Perímetro: ${forma.calcPerimetro().toStringAsFixed(2)}');
      //   });
      // }
      // questão c)
      //   listaDeFormas.forEach((element) {
      //     print(
      //         'Área: ${forma.calcArea().toStringAsFixed(2)}');
      //   });
      // }
    entrada == '0';
  }
}

int? pedeForma() {
  print('\nQuantas formas deseja criar?\n');
  return int.tryParse(stdin.readLineSync()!);
}

criaQuadrado(List<FormaGeometrica> listaDeFormas) {
  double? lado;
  while (lado == null) {
    print('\nQual o tamanho do lado?\n');
    double? ladoEntrada = double.tryParse(stdin.readLineSync()!);
    if (ladoEntrada is double) {
      lado = ladoEntrada;
    }
  }
  listaDeFormas.add(Quadrado(lado: lado));
}

criaRetangulo(List<FormaGeometrica> listaDeFormas) {
  double? altura;
  while (altura == null) {
    print('\nQual a altura?\n');
    double? alturaEntrada = double.tryParse(stdin.readLineSync()!);
    if (alturaEntrada is double) {
      altura = alturaEntrada;
    }
  }
  double? base;
  while (base == null) {
    print('\nQual a base?\n');
    double? baseEntrada = double.tryParse(stdin.readLineSync()!);
    if (baseEntrada is double) {
      base = baseEntrada;
    }
  }
  listaDeFormas.add(Retangulo(altura: altura, base: base));
}

criaCirculo(List<FormaGeometrica> listaDeFormas) {
  double? raio;
  while (raio == null) {
    print('\nQual o tamanho do raio?\n');
    double? raioEntrada = double.tryParse(stdin.readLineSync()!);
    if (raioEntrada is double) {
      raio = raioEntrada;
    }
  }
  listaDeFormas.add(Circulo(raio: raio));
}
