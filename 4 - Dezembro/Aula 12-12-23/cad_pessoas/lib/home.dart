import 'package:cad_pessoas/pageNovo.dart';
import 'package:cad_pessoas/pessoa.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    _vaiParaPageNovo() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PageNovo(),
        ),
      );
    }

    List<Pessoa> _pessoas = [
      Pessoa(nome: 'Gabriel'),
      Pessoa(nome: 'Gustavo'),
      Pessoa(nome: 'Carlos'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pessoas'),
      ),
      body: Center(
        child: Column(
          children: [
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
                          leading: const Icon(Icons.person, size: 50),
                          trailing: IconButton(
                            onPressed: () {
                              print(item.nome);
                            },
                            icon: Icon(
                              Icons.delete,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
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
    );
  }
}
