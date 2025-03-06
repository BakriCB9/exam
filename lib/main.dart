

import 'package:exam_app/features/register/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di.dart';


void main() {
   configureDependencies();
   runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,


     child:   MaterialApp(
      debugShowCheckedModeBanner: false,
onGenerateRoute: ,
      initialRoute: SignUpPage.signUp,

      routes: {
        SignUpPage.signUp: (context) => const SignUpPage(),
      },
      home: const SignUpPage(),
     ));}}