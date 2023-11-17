import 'conta.dart';

class ContaPoupanca implements Conta {
  @override
  double saldo;

  ContaPoupanca({this.saldo = 0});

  @override
  double get buscaSaldo => saldo;

  @override
  depositar(double valor) {
    if (valor > 0) {
      saldo += valor;
      print('Depósito realizado\n');
    } else {
      print('O valor é negativo\n');
    }
  }

  @override
  bool sacar(double valor) {
    if (saldo > valor) {
      saldo -= valor;
      return true;
    } else {
      return false;
    }
  }
}
