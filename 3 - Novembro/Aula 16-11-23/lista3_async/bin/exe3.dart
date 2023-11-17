void main() {
  funcao(funcaoNormal);
}

funcao(void Function() callback) async {
  await Future.delayed(Duration(seconds: 1));
  callback();
}

void funcaoNormal() {
  print('\nCallback\n');
}
