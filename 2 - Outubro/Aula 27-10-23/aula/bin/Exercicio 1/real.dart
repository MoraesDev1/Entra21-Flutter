class Real {
  double valor = 0;
}

extension RealMetodos on Real {
  int toInt() => valor.toInt();

  String paraString() => valor.toString();

  String paraStringAsFixed(int digits) {
    return valor.toStringAsFixed(digits);
  }

  void deString(String value) {
    valor = double.parse(value);
  }
}
