import 'Mixins/boxe.dart';
import 'Mixins/cantar.dart';
import 'Mixins/dancar.dart';
import 'Mixins/escrita.dart';
import 'Mixins/exercicio.dart';
import 'Mixins/leitura.dart';
import 'Mixins/pessoa.dart';

class Artista extends Pessoa with Cantar, Dancar {}

class Engenheiro extends Pessoa with Escrita, Leitura {}

class Atleta extends Pessoa with Exercicio {}

class Lutador extends Pessoa with Boxe {}

class Compositor extends Pessoa with Cantar, Escrita, Leitura {}

class Seguranca extends Pessoa with Boxe, Exercicio {}
