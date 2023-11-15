import 'dart:io';

void main() {
  String entrada = '';
  Map<String, List<Pessoa>> cadastros = {
    'Blumenau': [
      Pessoa('Pedro', 20, 'Solteiro'),
      Pessoa('Joana', 19, 'Solteira'),
      Pessoa('Gilmar', 40, 'Casado'),
    ],
    'Indaial': [
      Pessoa('Afonso', 55, 'Casado'),
      Pessoa('Mário', 46, 'Solteira'),
    ],
    'Brusque': [
      Pessoa('Ivonilson', 35, 'Solteiro'),
    ],
    'Gaspar': [
      Pessoa('Laura', 27, 'Casada'),
      Pessoa('Daniele', 33, 'Solteira'),
      Pessoa('Nilson', 18, 'Solteiro'),
    ],
  };
  print(
      '\nBem vindo ao sistema de cadastro de moradores\nPara sair da aplicação digite "Sair"');
  while (entrada != 'sair') {
    print('\nInforme a cidade');
    entrada = stdin.readLineSync()!.toLowerCase();
    switch (entrada) {
      case 'blumenau':
        exibirMoradores(entrada, cadastros);
        break;
      case 'indaial':
        exibirMoradores(entrada, cadastros);
        break;
      case 'brusque':
        exibirMoradores(entrada, cadastros);
        break;
      case 'gaspar':
        exibirMoradores(entrada, cadastros);
        break;
    }
  }
  print(exibeCidadeDaPessoaMaisVelha(cadastros));
}

exibirMoradores(String cidade, Map<String, List<Pessoa>> cadastros) {
  print(
      '\nMoradores da cidade de ${cidade[0].toUpperCase()}${cidade.substring(1)}:');
  cadastros.forEach(
    (key, value) {
      if (key.toLowerCase() == cidade) {
        for (Pessoa morador in value) {
          print(
              '\nNome: ${morador.nome}\nIdade: ${morador.idade}\nEstado Civil: ${morador.estadoCivil}');
        }
      }
    },
  );
}

String exibeCidadeDaPessoaMaisVelha(Map<String, List<Pessoa>> cadastros) {
  String cidadeDoMaisVelho = '';
  int idadeDoMaisVelho = 0;
  cadastros.forEach(
    (key, value) {
      for (Pessoa morador in value) {
        if (morador.idade > idadeDoMaisVelho) {
          cidadeDoMaisVelho = key;
          idadeDoMaisVelho = morador.idade;
        }
      }
    },
  );
  return cidadeDoMaisVelho;
}

class Pessoa {
  String nome;
  int idade;
  String estadoCivil;

  Pessoa(this.nome, this.idade, this.estadoCivil);
}
