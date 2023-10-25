import 'dart:io';
import 'bonificacoes.dart';
import 'engenheiro.dart';
import 'funcionario.dart';
import 'gerente.dart';
import 'supervisor.dart';

void main() {
  String? entrada;
  List<Funcionario> listaDeFuncionarios = [];

  while (entrada != 'SAIR') {
    print(
        '\nQual a opção desejada?\n\n1 - Cadastrar Funcionário\n2 - Cadastrar Gerente\n3 - Cadastrar Engenheiro\n4 - Cadastrar Supervisor\n5 - Sair\n');
    entrada = stdin.readLineSync()!;
    switch (entrada) {
      case '1':
        Funcionario funcionario = criaFuncionario();
        listaDeFuncionarios.add(funcionario);
        break;
      case '2':
        Gerente gerente = criaGerente();
        listaDeFuncionarios.add(gerente);
        break;
      case '3':
        Engenheiro engenheiro = criaEngenheiro();
        listaDeFuncionarios.add(engenheiro);
        break;
      case '4':
        Supervisor supervisor = criaSupervisor();
        listaDeFuncionarios.add(supervisor);
        break;
      case '5':
        entrada = 'SAIR';
        listarTodos(listaDeFuncionarios);
        break;
      default:
        print('Entrada inválida');
    }
  }
}

Funcionario criaFuncionario() {
  print('Informe o nome');
  String nome = stdin.readLineSync()!;
  print('Informe o CPF');
  String cpf = stdin.readLineSync()!;
  print('Informe o salário');
  double? salario = double.tryParse(stdin.readLineSync()!);
  return Funcionario(nome: nome, cpf: cpf, salario: salario!);
}

Gerente criaGerente() {
  print('Informe o nome');
  String nome = stdin.readLineSync()!;
  print('Informe o CPF');
  String cpf = stdin.readLineSync()!;
  print('Informe o salário');
  double? salario = double.tryParse(stdin.readLineSync()!);
  return Gerente(nome: nome, cpf: cpf, salario: salario!);
}

Engenheiro criaEngenheiro() {
  print('Informe o nome');
  String nome = stdin.readLineSync()!;
  print('Informe o CPF');
  String cpf = stdin.readLineSync()!;
  print('Informe o salário');
  double? salario = double.tryParse(stdin.readLineSync()!);
  return Engenheiro(nome: nome, cpf: cpf, salario: salario!);
}

Supervisor criaSupervisor() {
  print('Informe o nome');
  String nome = stdin.readLineSync()!;
  print('Informe o CPF');
  String cpf = stdin.readLineSync()!;
  print('Informe o salário');
  double? salario = double.tryParse(stdin.readLineSync()!);
  return Supervisor(nome: nome, cpf: cpf, salario: salario!);
}

listarTodos(List<Funcionario> listaDeFuncionarios) {
  Bonificacao bonificacao = Bonificacao();
  for (final element in listaDeFuncionarios) {
    if (element is Gerente) {
      Gerente gerente = element;
      print(
          'Cargo: Gerente\nNome: ${gerente.nome}\nCPF: ${gerente.cpf}\nSalário: ${gerente.salario}\nBonificação: ${gerente.calcularBonificacao()}\n');
      bonificacao.adicionaBonificacao(gerente.calcularBonificacao());
    } else if (element is Engenheiro) {
      Engenheiro engenheiro = element;
      print(
          'Cargo: Engenheiro\nNome: ${engenheiro.nome}\nCPF: ${engenheiro.cpf}\nSalário: ${engenheiro.salario}\nBonificação: ${engenheiro.calcularBonificacao()}\n');
      bonificacao.adicionaBonificacao(engenheiro.calcularBonificacao());
    } else if (element is Supervisor) {
      Supervisor supervisor = element;
      print(
          'Cargo: Supervisor\nNome: ${supervisor.nome}\nCPF: ${supervisor.cpf}\nSalário: ${supervisor.salario}\nBonificação: ${supervisor.calcularBonificacao()}\n');
      bonificacao.adicionaBonificacao(supervisor.calcularBonificacao());
    } else {
      Funcionario funcionario = element;
      print(
          'Cargo: Funcionário\nNome: ${funcionario.nome}\nCPF: ${funcionario.cpf}\nSalário: ${funcionario.salario}\nBonificação: ${funcionario.calcularBonificacao()}\n');

      bonificacao.adicionaBonificacao(funcionario.calcularBonificacao());
    }
  }

  bonificacao.imprimeTotal();
}
