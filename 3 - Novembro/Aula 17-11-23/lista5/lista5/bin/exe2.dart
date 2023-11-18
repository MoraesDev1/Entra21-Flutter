void main() {
  Stream banco = geraSaidax();
  banco.forEach(print);
}

geraSaidax() async* {
  String x = ' X';
  int multiplicador = 5;
  while (multiplicador > 0) {
    yield x * multiplicador;
    multiplicador--;
  }
}
