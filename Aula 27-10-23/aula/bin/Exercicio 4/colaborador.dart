class Colaborador {
  String? nome;
  int identificador = 0;
  static int contador = 0;

  Colaborador() {
    identificador = ++contador;
  }
}
