import 'package:cad_pessoas/base_de_dados.dart';
import 'package:cad_pessoas/page_novo.dart';
import 'package:cad_pessoas/widget_exibe_cadastro.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _vaiParaPageNovo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PageNovo(),
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
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 10.0),
                  itemCount: banco.listaDePessoas.length,
                  itemBuilder: (context, index) {
                    return ExibeCadastro(
                      pessoa: banco.percorreLista(),
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
                        fixedSize: const Size(60, 55),
                      ),
                      child: const Icon(Icons.add),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
