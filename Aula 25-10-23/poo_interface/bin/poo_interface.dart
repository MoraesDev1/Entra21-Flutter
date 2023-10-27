import 'dart:io';

import 'conta.dart';
import 'contacorrente.dart';
import 'contapoupanca.dart';

void main() {
  String? entrada;
  String sair = '0';
  while (entrada != sair) {
    print(
        'Qual tipo da conta?\n1 - Conta Corrente\n2 - Conta Poupança\n0 - Sair');
    entrada = stdin.readLineSync()!;
    switch (entrada) {
      case '1':
        Conta conta = ContaCorrente();
        String? operacao;
        while (operacao != sair) {
          print(
              'Qual operação deseja realizar?\n1 - Sacar\n2 - Depositar\n0 - Finalizar Sessão');
          operacao = stdin.readLineSync()!;
          switch (operacao) {
            case '1':
              print('Qual o valor que deseja sacar?');
              double? valor = double.tryParse(stdin.readLineSync()!);
              bool sacou = conta.sacar(valor!);
              if (sacou) {
                print('Saque realizado \n');
              } else {
                print('Saldo e limite insuficiente\n');
              }
              break;
            case '2':
              print('Qual o valor que deseja depositar?');
              double? valor = double.tryParse(stdin.readLineSync()!);
              conta.depositar(valor!);
              break;
            case '0':
              break;
            default:
              print('Operação inválida');
          }
        }
        print(conta.buscaSaldo);
        break;
      case '2':
        Conta conta = ContaPoupanca();
        String? operacao;
        while (operacao != sair) {
          print(
              'Qual operação deseja realizar?\n1 - Sacar\n2 - Depositar\n0 - Finalizar Sessão');
          operacao = stdin.readLineSync()!;
          switch (operacao) {
            case '1':
              print('Qual o valor que deseja sacar?');
              double? valor = double.tryParse(stdin.readLineSync()!);
              bool sacou = conta.sacar(valor!);
              if (sacou) {
                print('Saque realizado\n');
              } else {
                print('Saldo insuficiente\n');
              }
              break;
            case '2':
              print('Qual o valor que deseja depositar?');
              double? valor = double.tryParse(stdin.readLineSync()!);
              conta.depositar(valor!);
              break;
            case '0':
              break;
            default:
              print('Operação inválida');
          }
        }
        print(conta.buscaSaldo);
        break;
      case '0':
        break;
      default:
        print('Opção inválida');
    }
  }
}
