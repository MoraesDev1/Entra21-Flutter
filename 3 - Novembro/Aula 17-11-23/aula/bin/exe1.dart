import 'dart:io';

void main() {
  Fila<String> fila = Fila<String>();
  bool encerra = false;
  while (encerra == false) {
    print('\nApp de Fila');
    print(
        '\nQual ação deseja realziar?\n\n1 - Adicionar pessoa\n2 - Remover pessoa\n3 - Exibir lista\n4 - Encerrar aplicação');
    String acao = stdin.readLineSync()!;
    switch (acao) {
      case '1':
        print('\nQual o nome?');
        String nome = stdin.readLineSync()!;
        fila.insert(nome);
        print('\nPessoa adicionada');
        break;
      case '2':
        if (fila.fila.isNotEmpty) {
          fila.remove();
          print('\nPessoa removida');
        } else {
          print('\nNão há ninguém na fila');
        }
        break;
      case '3':
        if (fila.fila.isNotEmpty) {
          for (String pessoa in fila.fila) {
            print('\n$pessoa');
          }
        } else {
          print('\nNão há ninguém na fila');
        }

        break;
      case '4':
        encerra = true;
        print('\nAplicação encerrada');
        break;
      default:
        print('\nAção inválida');
    }
  }
}

class Fila<T> {
  List<T> fila = [];

  insert(T value) {
    fila.add(value);
  }

  T? remove() {
    return fila.isNotEmpty ? fila.removeAt(0) : null;
  }
}
