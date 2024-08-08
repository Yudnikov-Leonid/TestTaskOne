import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_task_one/core/conver_departament.dart';
import 'package:test_task_one/features/home/entities/person_entity.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({required this.person, super.key});

  final PersonEntity person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 240),
          child: Column(
            children: [
              ClipOval(child: Image.network(person.avatarUrl)),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${person.firstName} ${person.lastName}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    person.userTag,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade600),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                ConvertDepartment.department(person.department),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.star_outline,
                  size: 40,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  _getBirthDate(person.birthday),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  _getAge(person.birthday),
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.phone_outlined,
                  size: 40,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '+7 ${person.phone}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Expanded(child: SizedBox()),
              ],
            )
          ],
        ),
      ),
    );
  }

  String _getBirthDate(String raw) {
    final formatter = DateFormat('yyyy-MM-dd');
    final dateTime = formatter.parse(raw);
    return DateFormat('dd MMMM yyyy').format(dateTime);
  }

  String _getAge(String raw) {
    final formatter = DateFormat('yyyy-MM-dd');
    final dateTime = formatter.parse(raw);
    final ms = DateTime.now().millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch;
    return '${ms ~/ 86400000 ~/ 365} years';
  }
}
