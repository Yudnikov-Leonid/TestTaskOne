import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_task_one/core/conver_departament.dart';
import 'package:test_task_one/features/details/details_page.dart';
import 'package:test_task_one/features/home/entities/person_entity.dart';

class PersonWidget extends StatelessWidget {
  const PersonWidget(
      {required this.person, required this.showBirthday, super.key});

  final PersonEntity person;
  final bool showBirthday;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(person: person)));
        },
        child: Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            ClipOval(
                child: person.avatarUrl.isNotEmpty
                    ? Image.network(
                        person.avatarUrl,
                        height: 75,
                      )
                    : Container(
                        color: Colors.grey,
                        height: 75,
                        width: 75,
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
                Text(ConvertDepartment.department(person.department))
              ],
            ),
            const Expanded(child: SizedBox()),
            if (showBirthday)
              Text(
                DateFormat('dd MMM')
                    .format(DateFormat('yyyy-MM-dd').parse(person.birthday)),
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
