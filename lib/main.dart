

import 'package:exam_app/features/register/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';

import 'core/di/di.dart';


void main() {
   configureDependencies();
   runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: SignUpPage.signUp,

      routes: {
        SignUpPage.signUp: (context) => const SignUpPage(),
      },
      home: const SignUpPage(),
    );}}