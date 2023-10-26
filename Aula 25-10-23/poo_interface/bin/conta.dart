abstract class Conta {
  double saldo = 0;

  double get buscaSaldo {
    return saldo;
  }

  depositar(double valor) {
    saldo += valor;
  }

  sacar(double valor) {
    if (saldo >= valor) {
      saldo -= valor;
    }
  }
}
