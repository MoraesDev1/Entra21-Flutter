import 'dart:io';
import 'dart:isolate';

void main() async {
  bool mantemLaco = true;
  int contador = 0;
  _stopCounter().then((value) => mantemLaco = false);
  while (mantemLaco) {
    print('Contador: $contador');
    await Future.delayed(Duration(seconds: 1));
    contador++;
  }
}

Future<void> _stopCounter() async {
  final p = ReceivePort();
  Isolate.spawn(_readLine, p.sendPort);
  await p.first;
}

Future<void> _readLine(SendPort p) async {
  stdin.readLineSync()!;
  Isolate.exit(p);
}

// import 'dart:io';
// import 'dart:isolate';
// import 'package:async/async.dart';

// void main(List<String> args) async {
//   List<String> listFiles = [
//     'C:/Users/gabriel.ribeiro/Documents/nome.txt',
//     'C:/Users/gabriel.ribeiro/Documents/carro.txt',
//   ];
//   await for (final String strData in _readInBackground(listFiles)) {
//     print('File content: $strData');
//   }
// }

// Stream<String> _readInBackground(List<String> filenames) async* {
//   final p = ReceivePort();
//   await Isolate.spawn(_readFile, p.sendPort);

//   final events = StreamQueue<dynamic>(p);
//   SendPort sendPort = await events.next;

//   for (String fname in filenames) {
//     sendPort.send(fname);
//     String message = await events.next;
//     yield message;
//   }
//   sendPort.send(null);
//   await events.cancel();
// }

// Future<void> _readFile(SendPort p) async {
//   final commandPort = ReceivePort();
//   p.send(commandPort.sendPort);
//   await for (final message in commandPort) {
//     if (message is String) {
//       try {
//         final contents = await File(message).readAsString();
//         p.send(contents);
//       } catch (e) {
//         print(e);
//       }
//     } else if (message == null) {
//       break;
//     }
//   }
//   Isolate.exit();
// }
