class Pair {
  final List<int> sectionA;
  final List<int> sectionB;

  Pair(this.sectionA, this.sectionB);

  bool get hasOverlap => sectionA.any((element) => sectionB.contains(element));

  bool get sectionBCoversA =>
      sectionA.every((element) => sectionB.contains(element));

  bool get sectionACoversB =>
      sectionB.every((element) => sectionA.contains(element));
}
