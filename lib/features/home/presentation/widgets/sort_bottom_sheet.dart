import 'package:flutter/material.dart';
import 'package:test_task_one/core/colors.dart';
import 'package:test_task_one/features/home/entities/sort_type.dart';
import 'package:test_task_one/features/home/presentation/pages/home_bloc.dart';

class SortBottomSheet extends StatefulWidget {
  const SortBottomSheet({required this.bloc, required this.index, super.key});

  final HomeBloc bloc;
  final int index;

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  int _index = 0;

  @override
  void initState() {
    _index = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width - 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 60,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(16)),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Sorting',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          _element(SortByAlphabet(), 0),
          const SizedBox(
            height: 10,
          ),
          _element(SortByBirthday(), 1),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Widget _element(SortType type, int index) {
    return InkWell(
      onTap: () {
        widget.bloc.add(HomeChangeSortTypeEvent(type));
        setState(() {
          _index = index;
        });
      },
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: AppColors.mainColor,
                    width: _index == index ? 10 : 3),
                shape: BoxShape.circle),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            type.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
