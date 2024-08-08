import 'package:flutter/material.dart';
import 'package:test_task_one/core/conver_departament.dart';
import 'package:test_task_one/features/home/entities/person_entity.dart';

class PersonWidget extends StatelessWidget {
  const PersonWidget({required this.person, super.key});

  final PersonEntity person;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          ClipOval(
              child: Image.network(
            person.avatarUrl,
            height: 75,
          )),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${person.firstName} ${person.lastName}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    person.userTag.toLowerCase(),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600),
                  ),
                ],
              ),
              Text(ConvertDepartment.convert(person.department))
            ],
          )
        ],
      ),
    );
  }
}
