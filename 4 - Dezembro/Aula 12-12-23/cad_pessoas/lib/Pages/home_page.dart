import 'package:cad_pessoas/DB/base_de_dados.dart';
import 'package:cad_pessoas/Pages/novo_cadastro_page.dart';
import 'package:cad_pessoas/Widgets/exibe_cadastro_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _vaiParaPageNovo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageNovo(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Banco banco = Banco();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pessoas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10.0),
                itemCount: banco.listaDePessoas.length,
                itemBuilder: (context, index) {
                  return ExibeCadastro(
                    pessoa: banco.listaDePessoas[1],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: _vaiParaPageNovo,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(Icons.add),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
