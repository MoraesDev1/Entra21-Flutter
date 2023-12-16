import 'package:cad_pessoas/model/pessoa.dart';

abstract class PessoaDao {
  Future<Pessoa> salvar(Pessoa pessoa);
  excluir(Pessoa pessoa);
  atualizar(Pessoa pessoa);
  Future<List<Pessoa>> listar();
}
