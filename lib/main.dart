

import 'package:exam_app/core/routes_manager/route_generator.dart';
import 'package:exam_app/core/routes_manager/routes_name.dart';
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


     builder: (context,child)=>MaterialApp(
      debugShowCheckedModeBanner: false,
onGenerateRoute: RouteGenerator.getRoute,
       initialRoute: Routes.registerRoute,

      home: child,
     ));}}