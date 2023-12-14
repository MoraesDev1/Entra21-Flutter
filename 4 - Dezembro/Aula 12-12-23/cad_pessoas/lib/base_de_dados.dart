import 'package:cad_pessoas/pessoa.dart';

class Banco {
  List<Pessoa> listaDePessoas = [
    Pessoa(
      nome: 'Gabriel',
      email: 'gabriel@gmail.com',
      telefone: '47999999991',
      estadoCivil: 'Solteiro',
    ),
    Pessoa(
      nome: 'Gustavo',
      email: 'gustavo@gmail.com',
      telefone: '47999999992',
      estadoCivil: 'Casado',
    ),
    Pessoa(
      nome: 'Carlos',
      email: 'carlos@gmail.com',
      telefone: '47999999993',
      estadoCivil: 'Casado',
    ),
  ];
  int contador = 0;
  percorreLista() {
    if (listaDePessoas.isNotEmpty) {
      for (Pessoa pessoa in listaDePessoas) {
        pessoa.id; // melhorar logica
        return listaDePessoas[contador++];
      }
    }
  }
}
