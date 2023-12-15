// ignore_for_file: must_be_immutable

import 'package:cad_pessoas/Classes/pessoa.dart';
import 'package:cad_pessoas/DB/base_de_dados.dart';
import 'package:cad_pessoas/Pages/edicao_cadastro_page.dart';
import 'package:flutter/material.dart';

class ExibeCadastro extends StatelessWidget {
  Pessoa pessoa;
  ExibeCadastro({super.key, required this.pessoa});

  Banco banco = Banco();

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
      child: ElevatedButton(
        onPressed: vaiParaPageEdicao,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    pessoa.nome,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Text(
                pessoa.telefone,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  Text(
                    pessoa.email,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 60,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        pessoa.casado ? 'Casado' : 'Solteiro',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
