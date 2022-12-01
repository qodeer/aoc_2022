import '../../shared/elf.dart';
import '../../shared/utils.dart';

void main(List<String> args) async {
  final input = await readInputFile("1-1.txt");
  final elfs = createElfList(input);
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
