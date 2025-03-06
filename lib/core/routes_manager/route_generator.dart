 import 'package:exam_app/core/routes_manager/routes_name.dart';
import 'package:exam_app/features/login/presentation/screens/login_screen.dart';
import 'package:exam_app/features/register/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator
 {
static  Route<dynamic> getRoute(RouteSettings settings)
{


  switch(settings.name)
  {
    case Routes.registerRoute:
      return MaterialPageRoute(builder: (_)=> const SignUpPage());
    case Routes.loginRoute:
      return MaterialPageRoute(builder: (_)=> const LoginScreen());
    default:
      return unDefinedRoute();

  }
}
static  Route<dynamic> unDefinedRoute()
{

  return MaterialPageRoute(builder: (_)=> Scaffold(appBar: AppBar(title: const Text("No Route Found"),),));
}
 }