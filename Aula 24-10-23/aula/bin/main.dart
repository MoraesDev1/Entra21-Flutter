import 'dart:io';
import 'bonificacoes.dart';
import 'engenheiro.dart';
import 'funcionario.dart';
import 'gerente.dart';
import 'supervisor.dart';

void main() {
  String? entrada;
  List<Funcionario> listaDeFuncionarios = [];
  List<Gerente> listaDeGerentes = [];
  List<Engenheiro> listaDeEngenheiros = [];
  List<Supervisor> listaDeSupervisores = [];

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
        listaDeGerentes.add(gerente);
        break;
      case '3':
        Engenheiro engenheiro = criaEngenheiro();
        listaDeEngenheiros.add(engenheiro);
        break;
      case '4':
        Supervisor supervisor = criaSupervisor();
        listaDeSupervisores.add(supervisor);
        break;
      case '5':
        entrada = 'SAIR';
        listarTodos(listaDeFuncionarios, listaDeGerentes, listaDeEngenheiros,
            listaDeSupervisores);
        break;
      default:
        print('Entrada inválida');
    }
  }
}

criaFuncionario() {
  print('Informe o nome');
  String nome = stdin.readLineSync()!;
  print('Informe o CPF');
  String cpf = stdin.readLineSync()!;
  print('Informe o salário');
  double? salario = double.tryParse(stdin.readLineSync()!);
  return Funcionario(nome: nome, cpf: cpf, salario: salario!);
}

criaGerente() {
  print('Informe o nome');
  String nome = stdin.readLineSync()!;
  print('Informe o CPF');
  String cpf = stdin.readLineSync()!;
  print('Informe o salário');
  double? salario = double.tryParse(stdin.readLineSync()!);
  return Gerente(nome: nome, cpf: cpf, salario: salario!);
}

criaEngenheiro() {
  print('Informe o nome');
  String nome = stdin.readLineSync()!;
  print('Informe o CPF');
  String cpf = stdin.readLineSync()!;
  print('Informe o salário');
  double? salario = double.tryParse(stdin.readLineSync()!);
  return Engenheiro(nome: nome, cpf: cpf, salario: salario!);
}

criaSupervisor() {
  print('Informe o nome');
  String nome = stdin.readLineSync()!;
  print('Informe o CPF');
  String cpf = stdin.readLineSync()!;
  print('Informe o salário');
  double? salario = double.tryParse(stdin.readLineSync()!);
  return Supervisor(nome: nome, cpf: cpf, salario: salario!);
}

listarTodos(
    List<Funcionario> listaDeFuncionarios,
    List<Gerente> listaDeGerentes,
    List<Engenheiro> listaDeEngenheiros,
    List<Supervisor> listaDeSupervisores) {
  Bonificacao bonificacao = Bonificacao();
  for (Funcionario funcionario in listaDeFuncionarios) {
    print(
        'Cargo: Funcionário\nNome: ${funcionario.nome}\nCPF: ${funcionario.cpf}\nSalário: ${funcionario.salario}\nBonificação: ${funcionario.calcularBonificacao()}\n');

    bonificacao.adicionaBonificacao(funcionario.calcularBonificacao());
  }
  for (Gerente gerente in listaDeGerentes) {
    print(
        'Cargo: Gerente\nNome: ${gerente.nome}\nCPF: ${gerente.cpf}\nSalário: ${gerente.salario}\nBonificação: ${gerente.calcularBonificacao()}\n');
    bonificacao.adicionaBonificacao(gerente.calcularBonificacao());
  }
  for (Engenheiro engenheiro in listaDeEngenheiros) {
    print(
        'Cargo: Engenheiro\nNome: ${engenheiro.nome}\nCPF: ${engenheiro.cpf}\nSalário: ${engenheiro.salario}\nBonificação: ${engenheiro.calcularBonificacao()}\n');
    bonificacao.adicionaBonificacao(engenheiro.calcularBonificacao());
  }
  for (Supervisor supervisor in listaDeSupervisores) {
    print(
        'Cargo: Supervisor\nNome: ${supervisor.nome}\nCPF: ${supervisor.cpf}\nSalário: ${supervisor.salario}\nBonificação: ${supervisor.calcularBonificacao()}\n');
    bonificacao.adicionaBonificacao(supervisor.calcularBonificacao());
  }
  bonificacao.imprimeTotal();
}
