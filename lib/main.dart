import 'package:exam_app/core/di/di.dart';
import 'package:exam_app/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const ExampApp());
}

class ExampApp extends StatelessWidget {
  const ExampApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
