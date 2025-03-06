import 'package:exam_app/config/appTheme.dart';
import 'package:exam_app/core/di/di.dart';
import 'package:exam_app/core/routes_manager/route_generator.dart';
import 'package:exam_app/core/routes_manager/routes_name.dart';
import 'package:exam_app/features/login/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  configureDependencies();
  await ScreenUtil.ensureScreenSize();
  runApp(const ExampApp());
}

class ExampApp extends StatelessWidget {
  const ExampApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.loginRoute,
          theme: AppTheme.lightTheme,
        );
      },
      // child:
    );
  }
}
