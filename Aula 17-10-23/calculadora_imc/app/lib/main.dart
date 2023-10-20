import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final _alturaController = TextEditingController();
    final _pesoController = TextEditingController();
    double margem1 = 15;
    Color corForte = Colors.amber.shade800;

    _verificaEntradaAltura() {
      String alturaStr = _alturaController.text.toString();
      String altform = alturaStr.replaceAll(',', '.').replaceAll(' ', '');
      print(altform);
      // double? altura = double.tryParse(alturaStr);

      // if (altura == null) {
      //   print('Altura invalida');
      // }
      // return altura;
    }

    // _verificaEntradaPeso() {}

    // _calculaImc() {}

    _click() {
      _verificaEntradaAltura();
      setState(() {
        _alturaController.clear();
        _pesoController.clear();
      });
    }

    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        backgroundColor: corForte,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(margem1),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/fatguy.png'),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  child: const Text(
                    'Informe sua altura e peso',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        controller: _alturaController,
                        decoration: const InputDecoration(
                          label: Text('Altura'),
                          suffixText: 'm',
                          focusColor: Colors.black,
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: margem1),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        controller: _pesoController,
                        decoration: const InputDecoration(
                          label: Text('Peso'),
                          labelStyle: TextStyle(color: Colors.black),
                          suffixText: 'Kg',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: margem1),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 55,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            backgroundColor: MaterialStatePropertyAll(corForte),
                          ),
                          onPressed: _click,
                          child: const Text(
                            'Calcular',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
