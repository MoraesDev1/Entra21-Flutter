void main() {
  Iterable tabuada = geraTabuada(10);
  tabuada.forEach(print);
}

geraTabuada(int numero) sync* {
  int numero2 = 1;
  while (numero2 < 11) {
    yield '$numero x $numero2 = ${numero * numero2}';
    numero2++;
  }
  if (numero > 0) {
    yield* (geraTabuada(numero - 1));
  }
}
