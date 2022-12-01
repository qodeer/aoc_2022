import 'dart:io';

import 'elf.dart';

Future<Iterable<String>> readInputFile(String file) async {
  return await File("inputs\\${file}").readAsLines();
}

List<Elf> createElfList(Iterable<String> input) {
  final List<Elf> list = List.empty(growable: true);

  Elf elf = Elf(id: 0);
  for (final line in input) {
    if (line.isEmpty) {
      list.add(elf);
      elf = Elf(id: elf.id + 1);
    } else {
      try {
        final calories = int.parse(line);
        elf.snacks.add(calories);
      } catch (e) {
        print(e);
      }
    }
  }

  return list;
}
