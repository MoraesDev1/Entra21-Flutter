import 'dart:io';

void main() {
  List<String> cadastros = ['Joao', 'Joaquim', 'José'];
  bool mantemLaco = true;
  while (mantemLaco) {
    print(
        '\nInforme a opção desejada\n1 - Cadastrar usuário\n2 - Exibir cadastro\n3 - Exibir lista\n4 - Finalizar');
    String opcao = stdin.readLineSync()!;
    switch (opcao) {
      case '1':
        cadastrarUsuario(cadastros);
        break;
      case '2':
        try {
          exibirCadastro(cadastros);
        } on RangeError catch (e) {
          print('\nIndice inválido');
        } on FormatException catch (e) {
          print('\nValor informado inválido');
        }
      case '3':
        exibirLista(cadastros);
        break;
      case '4':
        print('\nAplicação finalizada');
        mantemLaco = false;
      default:
        print('\nOpção inválida');
    }
  }
}

cadastrarUsuario(List<String> cadastros) {
  print('\nQual seu nome?');
  String nome = stdin.readLineSync()!;
  cadastros.add(nome);
}

exibirCadastro(List<String> cadastros) {
  print('\nQual o número de registro do cadastro?');
  int indice = int.parse(stdin.readLineSync()!);
  print('\nNome: ${cadastros[indice]}');
}

exibirLista(List<String> cadastros) {
  for (String nome in cadastros) {
    print('\nNome: $nome');
  }
}

class CustomException implements Exception {
  String cause;
  CustomException(this.cause);
}
