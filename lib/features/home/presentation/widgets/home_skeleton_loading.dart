import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:test_task_one/features/home/entities/person_entity.dart';
import 'package:test_task_one/features/home/presentation/widgets/person_widget.dart';

class HomeSkeletonLoading extends StatelessWidget {
  const HomeSkeletonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        child: ListView.builder(
            itemCount: 11,
            itemBuilder: (context, i) => PersonWidget(
                person: PersonEntity(
                    id: '',
                    avatarUrl: '',
                    firstName: 'First name',
                    lastName: 'Last name',
                    userTag: '',
                    department: 'management',
                    position: '',
                    birthday: '',
                    phone: ''),
                showBirthday: false)));
  }
}
