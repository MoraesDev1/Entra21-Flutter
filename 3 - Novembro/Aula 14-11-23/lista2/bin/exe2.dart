import 'dart:io';

void main() {
  hello(() => print('Hello'));
  confirmacao((opcao) => print('Opção: $opcao'));
  print(getNow((dt) => '20032003'));
}

hello(void Function() func) {
  func();
}

confirmacao(void Function(String opcao) callback) {
  print('Digite a opção:\n1 - Salvar\n2 - Cancelar');
  String opcao = stdin.readLineSync()!;
  callback(opcao);
}

String getNow(String Function(DateTime dt) converte) {
  return converte(DateTime.now());
}
