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
  sacar(double valor) {
    if (saldo > valor) {
      saldo -= valor;
      print('Saque realizado\n');
    } else if (valor < (saldo + limite)) {
      print(
          'Saque realizado utilizando R\$${(valor - saldo) - limite} do limite\n');
      saldo = ((valor - saldo) - limite) * -1;
    } else {
      print('Saldo e limite insuficiente\n');
    }
  }
}
