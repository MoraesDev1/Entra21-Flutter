import 'package:cad_pessoas/coleta_info_widget.dart';
import 'package:flutter/material.dart';

class PageNovo extends StatelessWidget {
  const PageNovo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Novo'),
      ),
      body: Column(
        children: [
          ColetaInfo(descricao: 'Nome'),
          ColetaInfo(descricao: 'E-mail'),
          ColetaInfo(descricao: 'Telefone'),
          ColetaInfo(descricao: 'Estado Civil'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Salvar'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
