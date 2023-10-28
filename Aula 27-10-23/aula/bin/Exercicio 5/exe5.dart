import 'package:intl/intl.dart';

void main() {
  final agora = DateTime.now();

  String agoraEmString = Utils.converteData(agora);

  print(agoraEmString);
}

class Utils {
  static DateFormat df = DateFormat("dd/MM/yyyy HH:mm:ss");

  static String converteData(DateTime dt) {
    return df.format(dt);
  }
}
