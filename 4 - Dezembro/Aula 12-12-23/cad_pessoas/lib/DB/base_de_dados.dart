import 'package:cad_pessoas/Classes/pessoa.dart';

class Banco {
  List<Pessoa> listaDePessoas = [
    Pessoa(
      nome: 'Gabriel',
      email: 'gabriel@gmail.com',
      telefone: '47999999991',
      casado: false,
    ),
    Pessoa(
      nome: 'Gustavo',
      email: 'gustavo@gmail.com',
      telefone: '47999999992',
      casado: false,
    ),
    Pessoa(
      nome: 'Carlos',
      email: 'carlos@gmail.com',
      telefone: '47999999993',
      casado: false,
    ),
    Pessoa(
      nome: 'João',
      email: 'joao@gmail.com',
      telefone: '47999999994',
      casado: false,
    ),
    Pessoa(
      nome: 'Maria',
      email: 'maria@gmail.com',
      telefone: '47999999995',
      casado: false,
    ),
    Pessoa(
      nome: 'Mariana',
      email: 'mariana@gmail.com',
      telefone: '47999999996',
      casado: false,
    ),
    Pessoa(
      nome: 'Zilda',
      email: 'zilda@gmail.com',
      telefone: '',
      casado: false,
    ),
  ];

  removePessoaLista(Pessoa cadastro) {
    for (Pessoa pessoa in listaDePessoas) {
      if (pessoa == cadastro) {
        listaDePessoas.remove(pessoa);
        break;
      }
    }
  }
}
