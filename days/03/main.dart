import '../../shared/utils.dart';
import 'group.dart';
import 'rucksack.dart';

void main(List<String> args) async {
  final input = await readInputFile("3-1.txt");
  var rucksacks = input.map((e) => Rucksack(supplies: e)).toList();

  partOne(rucksacks);
  partTwo(rucksacks);
}

void partOne(List<Rucksack> input) {
  final characterValues = _getCharacterValue();
  final totalPriority = input.fold(
      0,
      (previousValue, element) =>
          previousValue +
          characterValues.indexOf(element.duplicateItems.first));

  print("P1: Total priority is ${totalPriority}");
}

void partTwo(List<Rucksack> rucksacks) {
  final characterValues = _getCharacterValue();
  final groups = chunkList(rucksacks, 3).map((e) => Group(e));
  final totalPriority = groups.fold(
      0,
      (previousValue, element) =>
          previousValue + characterValues.indexOf(element.badge));
  print("P2: Total priority is ${totalPriority}");
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
