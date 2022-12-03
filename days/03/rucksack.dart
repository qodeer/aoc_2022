// ignore_for_file: public_member_api_docs, sort_constructors_first

class Rucksack {
  final String supplies;

  Iterable<String> get items => supplies.split("");

  String get compartmentA =>
      supplies.substring(0, (supplies.length / 2).ceil());

  String get compartmentB => supplies.substring((supplies.length / 2).ceil());

  Iterable<String> get duplicateItems => compartmentA
      .split("")
      .where((element) => compartmentB.indexOf(element) != -1);

  Rucksack({
    required this.supplies,
  });

  Rucksack copyWith({
    String? supplies,
  }) {
    return Rucksack(
      supplies: supplies ?? this.supplies,
    );
  }
}
