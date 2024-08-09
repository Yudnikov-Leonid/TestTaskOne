import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_task_one/features/home/presentation/pages/home_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MediaQuery.withClampedTextScaling(
        minScaleFactor: 0.8,
        maxScaleFactor: 1.2,
        child: const HomePage(),
      ),
    );
  }
}
