import 'package:aula/pessoa.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() => runApp(
      MaterialApp(
        home: const Home(),
        theme: ThemeData(
          useMaterial3: false,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Database? _db;
  final _controller = TextEditingController();
  List<Pessoa> _pessoas = [];

  iniciarBanco() async {
    WidgetsFlutterBinding.ensureInitialized();
    _db = await openDatabase(
      join(await getDatabasesPath(), 'teste.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE pessoas(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT)',
        );
      },
      version: 1,
    );
  }

  @override
  void initState() {
    super.initState();
    iniciarBanco().then((_) {});
  }

  _buscaTodos() async {
    if (_db != null) {
      final List<Map<String, dynamic>> result = await _db!.query('pessoas');
      _pessoas = result.map((element) => Pessoa.fromMap(element)).toList();
      setState(() {});
    }
  }

  _clickAdd() async {
    if (_controller.text.isNotEmpty) {
      Pessoa pessoa = Pessoa(id: null, nome: _controller.text);
      await _db?.insert('pessoas', pessoa.toMap());
      //await _db.execute("insert into pessoas (nome) values(?)", [pessoa.nome]);

      _buscaTodos();
      setState(() {
        _controller.text = '';
      });
      // ignore: use_build_context_synchronously
      FocusScope.of(this.context).requestFocus(FocusNode());
    }
  }

  _excluir(Pessoa pessoa) {
    _db?.delete('pessoas',
        where: 'id = ? and nome = ?', whereArgs: [pessoa.id, pessoa.nome]);
  }

  _clickExibir() async {
    _buscaTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste DB'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Nome',
                        border: OutlineInputBorder(), // InputBorder.none
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: _clickAdd,
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(60, 55),
                    ),
                    child: const Icon(Icons.add),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _clickExibir,
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(0, 55),
                      ),
                      child: const Text(
                        'Exibir',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  for (final item in _pessoas)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: ListTile(
                          title: const Text(
                            'Nome',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            item.nome,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
