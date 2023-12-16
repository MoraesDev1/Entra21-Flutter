import 'package:cad_pessoas/dao/pessoa_dao.dart';
import 'package:cad_pessoas/model/pessoa.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PessoaDaoDb implements PessoaDao {
  late Database _db;

  PessoaDaoDb() {
    iniciarBanco();
  }

  iniciarBanco() async {
    WidgetsFlutterBinding.ensureInitialized();
    _db = await openDatabase(
      join(await getDatabasesPath(), 'cad_pessoas.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE pessoas(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, email TEXT, telefone TEXT, estadoCivil BOOL)',
        );
      },
      version: 1,
    );
  }

  @override
  atualizar(Pessoa pessoa) {}

  @override
  excluir(Pessoa pessoa) {}

  @override
  Future<List<Pessoa>> listar() async {
    List<Pessoa> _pessoas;
    final List<Map<String, dynamic>> result = await _db!.query('pessoas');
    _pessoas = result.map((element) => Pessoa.fromMap(element)).toList();
    return _pessoas;
  }

  @override
  Future<Pessoa> salvar(Pessoa pessoa) async {
    Future<int> result = _db.insert('pessoas', pessoa.toMap());
    result.then((value) => pessoa.id = value);
    return pessoa;
  }
}
