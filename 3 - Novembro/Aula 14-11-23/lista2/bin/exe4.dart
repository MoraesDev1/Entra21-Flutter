void main() {
  List<int> lista = [7, 2, -1, 14, 50, 36, 13, 8, 21, 70, 20, 10, 66, 9, 12];

  print(lista);
  print('${lista.firstWhere((element) => element > 50)}');
  print('${lista.lastWhere((element) => element > 50)}');
  print('${lista.where((element) => element % 2 == 0)}');
  print('${lista.map((e) => e * 10)}');
  print('${lista.every((element) => element > 0)}');
  print('${lista.any((element) => element == 11)}');
}
