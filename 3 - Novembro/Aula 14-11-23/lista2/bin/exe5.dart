import 'dart:io';

void main() {
  var cidades = {
    '101': 'Blumenau',
    '200': 'Gaspar',
    '300': 'Itajaí',
    '400': 'Florianópolis'
  };
  String entrada = '';
  while (entrada != '0') {
    print('Informe o código da sua cidade');
    entrada = stdin.readLineSync()!;
    switch (entrada) {
      case '101':
        print(cidades[entrada]);
        break;
      case '200':
        print(cidades[entrada]);
        break;
      case '300':
        print(cidades[entrada]);
        break;
      case '400':
        print(cidades[entrada]);
        break;
      case '0':
        break;
      default:
        print('Código não localizado');
    }
  }
}
