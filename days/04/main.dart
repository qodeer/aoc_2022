import '../../shared/utils.dart';
import 'pair.dart';

void main(List<String> args) async {
  final input = await readInputFile("4-1.txt");
  final pairs = _createPairs(input);
  partOne(pairs);
}

void partOne(List<Pair> pairs) {
  final fullyOverlap = pairs.fold(
      0,
      (previousValue, element) =>
          element.sectionACoversB || element.sectionBCoversA
              ? previousValue + 1
              : previousValue);
  print("There are ${fullyOverlap} sections that overlap.");
}

List<Pair> _createPairs(Iterable<String> input) {
  List<Pair> list = List.empty(growable: true);
  for (final line in input) {
    try {
      final linePair = line.split(",");
      final sectionA = _generateListFromRange(linePair[0]);
      final sectionB = _generateListFromRange(linePair[1]);
      list.add(Pair(sectionA, sectionB));
    } catch (e) {
      print("Could not create pair from line: ${line}");
    }
  }

  return list;
}

List<int> _generateListFromRange(String range) {
  if (range.isEmpty) {
    throw new Exception("Range is empty");
  }

  try {
    final values = range.split("-").map((e) => int.parse(e)).toList();
    final from = values[0];
    final to = values[1];
    return List<int>.generate(to - from + 1, (index) => index + from);
  } catch (e) {
    print(e);
    throw new Exception("Could not create List from range: ${range}");
  }
}
