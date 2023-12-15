class Pessoa {
  late int? id;
  late String nome;
  late String telefone;
  late String email;
  late bool casado;

  Pessoa({
    this.id,
    required this.nome,
    required this.telefone,
    required this.email,
    required this.casado,
  });
}
