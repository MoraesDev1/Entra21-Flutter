void main() {
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
  print('\nA)');
  exibirMoradores('Gaspar', cadastros);

  print('\nB)');
  print(
      'A cidade da pessoa mais velha é ${exibeCidadeDaPessoaMaisVelha(cadastros)}');

  print('\nC)');
  print(
      'O nome da pessoa mais jovem é ${exibeNomeDaPessoaMaisJovem(cadastros)}');

  print('\nD)');
  exibeQuantidadeDePessoasPorCidade(cadastros);
}

exibirMoradores(String cidade, Map<String, List<Pessoa>> cadastros) {
  print(
      '\nMoradores da cidade de ${cidade[0].toUpperCase()}${cidade.substring(1)}:');
  cadastros.forEach(
    (key, value) {
      if (key.toLowerCase() == cidade.toLowerCase()) {
        for (Pessoa morador in value) {
          print('Nome: ${morador.nome}');
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

String exibeNomeDaPessoaMaisJovem(Map<String, List<Pessoa>> cadastros) {
  String nomeDoMaisNovo = '';
  int idadeDoMaisNovo = 1000000;
  cadastros.forEach(
    (key, value) {
      for (Pessoa morador in value) {
        if (morador.idade < idadeDoMaisNovo) {
          nomeDoMaisNovo = morador.nome;
          idadeDoMaisNovo = morador.idade;
        }
      }
    },
  );
  return nomeDoMaisNovo;
}

exibeQuantidadeDePessoasPorCidade(Map<String, List<Pessoa>> cadastros) {
  cadastros.forEach((key, value) {
    print('Cidade: $key\nQuantidade de moradores: ${value.length}\n');
  });
}

class Pessoa {
  String nome;
  int idade;
  String estadoCivil;

  Pessoa(this.nome, this.idade, this.estadoCivil);
}
