void main() {
  int valor = -10;
  if (valor.ePositivo()) {
    print('É positivo');
  }
  if (valor.eNegativo()) {
    print('É negativo');
  }
}

extension TipoInt on int {
  bool ePositivo() {
    return this >= 0;
  }

  bool eNegativo() {
    return this < 0;
  }
}
