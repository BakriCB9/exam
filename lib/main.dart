import 'package:device_preview/device_preview.dart';
import 'package:exam_app/config/appTheme.dart';
import 'package:exam_app/core/di/di.dart';
import 'package:exam_app/core/helper_function/help_function.dart';
import 'package:exam_app/core/routes_manager/route_generator.dart';
import 'package:exam_app/core/routes_manager/routes_name.dart';
import 'package:exam_app/features/exam/presentation/view_model/cubit/exam_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String? userToken;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  userToken = await getToken();
  await ScreenUtil.ensureScreenSize();

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => ExampApp(), // Wrap your app
    ),
  );
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
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt.get<ExamViewModelCubit>())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute:
                userToken == null ? Routes.loginRoute : Routes.examHomeRoute,
            theme: AppTheme.lightTheme,
          ),
        );
      },
      // child:
    );
  }
}
