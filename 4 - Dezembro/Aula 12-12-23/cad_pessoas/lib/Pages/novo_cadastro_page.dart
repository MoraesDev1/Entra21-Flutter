import 'package:cad_pessoas/Widgets/coleta_info_widget.dart';
import 'package:cad_pessoas/Widgets/custom_switch_widget.dart';
import 'package:flutter/material.dart';

class PageNovo extends StatefulWidget {
  const PageNovo({super.key});

  @override
  State<PageNovo> createState() => _PageNovoState();
}

class _PageNovoState extends State<PageNovo> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _estadoCivilController = CustomSwitchController();
  _esconderTeclado() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('Novo'),
      ),
      body: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ColetaInfo(
                label: 'Nome',
                hint: 'Informe seu nome',
                controller: _nomeController,
              ),
              ColetaInfo(
                label: 'Telefone',
                hint: 'Informe seu telefone',
                controller: _emailController,
              ),
              ColetaInfo(
                label: 'E-mail',
                hint: 'Informe seu e-mail',
                controller: _telefoneController,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('Casado?'),
                    CustomSwitch(
                      controller: _estadoCivilController,
                      onChanged: () {
                        _esconderTeclado();
                      },
                    )
                  ],
                ),
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
        ),
      ),
    );
  }
}
