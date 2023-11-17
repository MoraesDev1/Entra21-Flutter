void main() {
  hello();
  mostrar('Abóbora');
  int resultado = duplicar(7);
  print(resultado.toStringAsFixed(2));
}

hello() => print('Hello');

mostrar(String texto) => print(texto);

int duplicar(int valor) => valor * 2;
