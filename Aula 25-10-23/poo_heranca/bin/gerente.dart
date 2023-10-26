import 'funcionario.dart';

class Gerente extends Funcionario {
  Gerente({required super.nome, required super.cpf, required super.salario});

  @override
  double calcularBonificacao() {
    return salario * 0.15;
  }
}
