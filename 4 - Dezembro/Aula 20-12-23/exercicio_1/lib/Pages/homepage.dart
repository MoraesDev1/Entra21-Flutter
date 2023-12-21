import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nomeController = TextEditingController();
  final _idadeController = TextEditingController();
  bool _estadoCivil = false;

  @override
  initState() {
    _buscaDados();
  }

  _buscaDados() {
    SharedPreferences.getInstance().then(
      (prefs) {
        _nomeController.text = prefs.getString('nome') ?? '';
        _idadeController.text = prefs.getInt('idade')?.toString() ?? '';
        _estadoCivil = prefs.getBool('estadoCivil') ?? false;
        setState(() {});
      },
    );
  }

  _clickSalvar() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', _nomeController.text);
    await prefs.setInt('idade', int.parse(_idadeController.text));
    await prefs.setBool('estadoCivil', _estadoCivil);
    _clear();
  }

  _clear() {
    _nomeController.text = "";
    _idadeController.text = "";
    _estadoCivil = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shared Preferences')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _nomeController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _idadeController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Idade',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Text('Estado Civil'),
                const SizedBox(
                  width: 10,
                ),
                Switch(
                    value: _estadoCivil,
                    onChanged: (value) {
                      setState(() {
                        _estadoCivil = value;
                      });
                    })
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _clickSalvar,
                    child: const Text('Salvar'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
