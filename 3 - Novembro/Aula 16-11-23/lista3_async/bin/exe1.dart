void main() {
  contador();
}

contador() async {
  for (int contador = 1; contador < 11; contador++) {
    await Future.delayed(Duration(seconds: 1));
    print(contador);
  }
}
