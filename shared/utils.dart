import 'dart:io';

Future<Iterable<String>> readInputFile(String file) async {
  return await File("inputs\\${file}").readAsLines();
}

Iterable<Iterable<T>> chunkList<T>(List<T> list, int chunkSize) {
  final List<List<T>> chunks = List.empty(growable: true);
  for (var i = 0; i < list.length; i += chunkSize) {
    chunks.add(list.sublist(
        i, i + chunkSize > list.length ? list.length : i + chunkSize));
  }

  return chunks;
}
