import 'package:cad_pessoas/Widgets/coleta_info_widget.dart';
import 'package:flutter/material.dart';

class PageNovo extends StatefulWidget {
  const PageNovo({super.key});

  @override
  State<PageNovo> createState() => _PageNovoState();
}

final _nomeController = TextEditingController();
final _emailController = TextEditingController();
final _telefoneController = TextEditingController();
bool _casadoController = false;

class _PageNovoState extends State<PageNovo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('Novo'),
      ),
      body: Column(
        children: [
          ColetaInfo(descricao: 'Nome', controller: _nomeController),
          ColetaInfo(
            descricao: 'E-mail',
            controller: _emailController,
          ),
          ColetaInfo(
            descricao: 'Telefone',
            controller: _telefoneController,
          ),
          Switch(
            value: _casadoController,
            onChanged: (value) {
              setState(() {
                _casadoController = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Salvar'),
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
