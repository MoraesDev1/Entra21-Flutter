void main() {
  double resultado = calcula(10, (valor) => valor * 2);
  print(resultado); // Exibe 20
}

double calcula(double numero, double Function(double valor) operacao) {
  return operacao(numero);
}
