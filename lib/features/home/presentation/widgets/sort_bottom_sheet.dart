import 'package:flutter/material.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({super.key});

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
          _element('By alphabet', true),
          const SizedBox(
            height: 10,
          ),
          _element('By birthday', false),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Widget _element(String text, bool isSelected) {
    return Row(
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
                  color: const Color.fromARGB(255, 101, 52, 255),
                  width: isSelected ? 10 : 3),
              shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
