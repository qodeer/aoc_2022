import '../../shared/utils.dart';
import 'rucksack.dart';

void main(List<String> args) async {
  final input = await readInputFile("3-1.txt");
  partOne(input);
}

void partOne(Iterable<String> input) {
  final characterValues = _getCharacterValue();
  int totalPriority = 0;
  for (final line in input) {
    final rucksack = Rucksack(supplies: line);
    final priority = characterValues.indexOf(rucksack.duplicateItems.first);
    totalPriority += priority;

    print(
        "${rucksack.compartmentA}-${rucksack.compartmentB}: ${rucksack.duplicateItems} - ${priority}");
  }
  print("Total priority is ${totalPriority}");
}

List<String> _getCharacterValue() {
  // Add empty character for index 0;
  final characters = [""];
  characters
    ..addAll(new List<String>.generate(
        26, (int index) => String.fromCharCode(index + 97)))
    ..addAll(List<String>.generate(
        26, (int index) => String.fromCharCode(index + 65)));
  return characters;
}
