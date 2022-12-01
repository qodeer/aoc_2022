// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Elf {
  final int id;
  final List<int> snacks;
  int get totalCalories => snacks.fold(0, (value, element) => value + element);

  Elf({required this.id, List<int>? snacks})
      : this.snacks = snacks ?? List.empty(growable: true);

  Elf copyWith({
    List<int>? snacks,
  }) {
    return Elf(
      id: this.id,
      snacks: snacks ?? this.snacks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'snacks': snacks,
    };
  }

  factory Elf.fromMap(Map<String, dynamic> map) {
    return Elf(
        id: map['id'],
        snacks: List<int>.from(
          (map['snacks'] as List<int>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Elf.fromJson(String source) =>
      Elf.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Test(snacks: $snacks)';

  @override
  int get hashCode => snacks.hashCode;
}
