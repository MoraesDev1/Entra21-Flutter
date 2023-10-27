import 'conta.dart';

class ContaCorrente implements Conta {
  @override
  double saldo;
  double limite = 200;

  ContaCorrente({this.limite = 200, this.saldo = 0});

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
    if (valor < (saldo + limite)) {
      saldo = (valor - saldo);
      return true;
    } else {
      return false;
    }
  }
}
