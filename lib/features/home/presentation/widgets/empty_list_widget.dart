import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/empty_list.png'),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'We didn\'t find anyone',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Try adjusting your request',
            style: TextStyle(
                fontSize: 19, color: Colors.grey, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
