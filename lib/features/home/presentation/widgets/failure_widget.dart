import 'package:flutter/material.dart';
import 'package:test_task_one/core/colors.dart';
import 'package:test_task_one/features/home/presentation/pages/home_bloc.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget(this.message, {required this.bloc, super.key});

  final String message;
  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/failure.png',
            scale: 0.9,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          TextButton(
              onPressed: () {
                bloc.add(HomeRefreshEvent());
              },
              child: const Text(
                'Retry',
                style: TextStyle(color: AppColors.mainColor, fontSize: 20),
              ))
        ],
      ),
    );
  }
}
