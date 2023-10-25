import 'funcionario.dart';

class Supervisor extends Funcionario {
  Supervisor({required super.nome, required super.cpf, required super.salario});

  @override
  double calcularBonificacao() {
    return salario * 1.12;
  }
}
