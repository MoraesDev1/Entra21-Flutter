class Pessoa {
  late int? id;
  late String nome;
  late String telefone;
  late String email;
  late bool estadoCivil;

  Pessoa(
      {this.id,
      required this.nome,
      this.telefone = "",
      this.email = "",
      this.estadoCivil = false});

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'telefone': telefone,
      'email': email,
      'estadoCivil': estadoCivil
    };
  }

  static Pessoa fromMap(Map<String, dynamic> map) {
    return Pessoa(
        id: map['id'],
        nome: map['nome'],
        email: map['email'],
        telefone: map['telefone'],
        estadoCivil: map['estadoCivil']);
  }
}
