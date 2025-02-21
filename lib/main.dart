

import 'package:exam_app/features/register/data/data_source/api_manger.dart';
import 'package:exam_app/features/register/data/repo/user_repo_impl.dart';
import 'package:exam_app/features/register/domain/repo/user_repo.dart';
import 'package:exam_app/features/register/domain/usecase/register_user.dart';
import 'package:exam_app/features/register/presentation/cubit/register_cubit.dart';
import 'package:exam_app/features/register/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {     
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider<UserRepo>(
        create: (context) => UserRepoImpl(ApiManger()), // Providing UserRepoImpl
        child: BlocProvider(
          create: (context) {
            // Retrieving UserRepoImpl here
            final userRepo = RepositoryProvider.of<UserRepo>(context);
            return RegistrationCubit(RegisterUser(userRepo)); // Passing UserRepo into RegisterUser
          },
          child: SignUpPage(),
        ),
      ),
    );}}