// ignore_for_file: must_be_immutable

import 'package:cad_pessoas/page_edicao_cadastro.dart';
import 'package:cad_pessoas/pessoa.dart';
import 'package:flutter/material.dart';

class ExibeCadastro extends StatelessWidget {
  late Pessoa pessoa;
  ExibeCadastro({super.key, required this.pessoa});

  @override
  Widget build(BuildContext context) {
    vaiParaPageEdicao() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EdicaoCadastro(),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: ListTile(
          onTap: vaiParaPageEdicao,
          title: const Text(
            'Nome',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            pessoa.nome,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          leading: const Icon(Icons.person, size: 50),
          trailing: IconButton(
            onPressed: () {
              print(pessoa.nome);
            },
            icon: const Icon(
              Icons.delete,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
