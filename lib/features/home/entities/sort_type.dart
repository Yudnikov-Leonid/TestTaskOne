import 'package:test_task_one/features/home/entities/person_entity.dart';

abstract class SortType {
  abstract String name;
  abstract int index;
  List<PersonEntity> sort(List<PersonEntity> list);
}

class SortByAlphabet extends SortType {
  @override
  List<PersonEntity> sort(List<PersonEntity> list) {
    final newList = List<PersonEntity>.from(list);
    newList.sort((a, b) => '${a.firstName} ${a.lastName}'
        .compareTo('${b.firstName} ${b.lastName}'));
    return newList;
  }
  
  @override
  String name = 'By alphabet';
  
  @override
  int index = 0;
}

class SortByBirthday extends SortType {
  @override
  List<PersonEntity> sort(List<PersonEntity> list) {
    final newList = List<PersonEntity>.from(list);
    newList.sort((a, b) => a.birthday.compareTo(b.birthday));
    return newList;
  }
  
  @override
  String name = 'By birthday';
  
  @override
  int index = 1;
}
