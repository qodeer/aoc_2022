import 'rucksack.dart';

class Group {
  final List<Rucksack> _members = List.empty(growable: true);

  String get badge {
    return _members.first.items.firstWhere((element) {
      for (final member in _members) {
        if (member.supplies.indexOf(element) == -1) {
          return false;
        }
      }
      return true;
    });
  }

  Group(Iterable<Rucksack> members) {
    _members.addAll(members);
  }
}
