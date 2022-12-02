import 'dart:io';

Future<Iterable<String>> readInputFile(String file) async {
  return await File("inputs\\${file}").readAsLines();
}
