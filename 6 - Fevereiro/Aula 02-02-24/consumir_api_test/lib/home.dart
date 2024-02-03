import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Home extends StatelessWidget {
  Home({super.key});

  final dio = Dio();

  void getHttp() async {
    final response = await dio.get('http://192.168.0.78:3333/pessoas');
    print(response);
  }

  _click() {
    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Test'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: _click, child: Text('getHTTP'))
            ],
          )
        ],
      ),
    );
  }
}
