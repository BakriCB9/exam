

import 'package:exam_app/core/di/di.dart';
import 'package:exam_app/features/register/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'features/register/presentation/cubit/register_cubit.dart';

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
      home: const SignUpPage(),
    );}}