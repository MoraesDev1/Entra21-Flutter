import 'package:cad_pessoas/dao/impl/pessoa_dao_db.dart';
import 'package:cad_pessoas/model/pessoa.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  Item({
    super.key,
    required this.pessoa,
  });

  late Pessoa pessoa;

  PessoaDaoDb pessoaDaoDb = PessoaDaoDb();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(pessoa.nome),
      subtitle: Column(children: [
        Text(pessoa.telefone),
        Text(pessoa.id.toString()),
      ]),
      leading: Icon(
        Icons.save,
        size: 30,
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete, size: 30),
        onPressed: () {
          pessoaDaoDb.excluir(pessoa);
        },
      ),
      onTap: () {},
    );
  }
}
