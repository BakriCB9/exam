import 'package:exam_app/core/routes_manager/routes_name.dart';
import 'package:exam_app/features/exam/presentation/view/exams_subject_screen.dart';
import 'package:exam_app/features/exam/presentation/view/home_exam_screen.dart';
import 'package:exam_app/features/exam/presentation/view/question_scree.dart';
import 'package:exam_app/features/exam/presentation/view/score_screen.dart';
import 'package:exam_app/features/login/presentation/screens/login_screen.dart';
import 'package:exam_app/features/register/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.scoreScreen:
        return MaterialPageRoute(builder: (_) => const ScoreScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.examHomeRoute:
        return MaterialPageRoute(builder: (_) => HomeExamScreen());
      case Routes.examSubjectScreen:
        {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
              builder: (_) => ExamsSubjectScreen(title: args['title']));
        }
      case Routes.questionScreen:
        {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
              builder: (_) =>
                  QuestionScreen(durationOfExam: args['durationOfexam']));
        }

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: const Text("No Route Found")),
            ));
  }
}
