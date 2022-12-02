import '../../shared/utils.dart';
import 'elf.dart';

void main(List<String> args) async {
  final input = await readInputFile("1-1.txt");
  final elfs = _createElfList(input);
  print("There are ${elfs.length} elfs.");
  elfs.sort((a, b) => b.totalCalories.compareTo(a.totalCalories));

  partOne(elfs);
  partTwo(elfs, 3);
}

void partOne(Iterable<Elf> sortedElfs) {
  final topElf = sortedElfs.first;
  print(
      "The elf with the most calories is: ${topElf.id} with a total of ${topElf.totalCalories}");
}

void partTwo(Iterable<Elf> sortedElfs, int takeTop) {
  final topElfs = sortedElfs.take(takeTop);
  final totalCalories =
      topElfs.fold(0, (value, element) => value + element.totalCalories);
  print(
      "The top ${takeTop} elfs with the most calories are:with a total of ${totalCalories}");
  for (final elf in topElfs) {
    print(
        "Elf: ${elf.id}; Snacks: ${elf.snacks.length} with total calories: ${elf.totalCalories}");
  }
  print("with a total of ${totalCalories}");
}

List<Elf> _createElfList(Iterable<String> input) {
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
