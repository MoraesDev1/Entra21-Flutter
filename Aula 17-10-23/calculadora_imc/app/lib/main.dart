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
  final _alturaController = TextEditingController();
  final _pesoController = TextEditingController();
  double margem1 = 15;
  Color corForte = Colors.amber.shade800;
  String _imc = '';
  String _mensagem = 'Informe sua altura e peso';
  String _image = 'assets/normal.png';

  @override
  Widget build(BuildContext context) {
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
                Image(
                  image: AssetImage(_image),
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 15),
                Text(
                  _mensagem,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(_imc),
                const SizedBox(height: 20),
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

  _click() {
    String alturaStr = _alturaController.text.toString();
    alturaStr = alturaStr.replaceAll(',', '.').replaceAll(' ', '');

    String pesoStr = _pesoController.text.toString();
    pesoStr = pesoStr.replaceAll(',', '.').replaceAll(' ', '');

    double? altura = double.tryParse(alturaStr);
    double? peso = double.tryParse(pesoStr);

    if (altura != null && peso != null) {
      double imc = peso / (altura * altura);
      _imc = 'IMC: ${imc.toStringAsFixed(1)}';

      if (imc < 18.5) {
        _mensagem = "Abaixo do peso";
        _image = 'assets/abaixodopeso.png';
      } else if (imc < 25) {
        _mensagem = "Normal";
        _image = 'assets/normal.png';
      } else if (imc < 30) {
        _mensagem = "Sobrepeso";
        _image = 'assets/sobrepeso.png';
      } else if (imc < 40) {
        _mensagem = "Obesidade";
        _image = 'assets/obesidade.png';
      } else {
        _mensagem = "Obesidade grave";
        _image = 'assets/obesidadegrave.png';
      }
    }
    setState(() {
      _alturaController.clear();
      _pesoController.clear();
    });
  }
}
