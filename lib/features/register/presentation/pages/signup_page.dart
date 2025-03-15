import 'package:exam_app/features/register/presentation/cubit/cubit_state.dart';
import 'package:exam_app/features/register/presentation/cubit/register_cubit.dart';
import 'package:exam_app/features/register/presentation/widgets/sign_button.dart';
import 'package:exam_app/features/register/presentation/widgets/sign_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/di.dart';
import '../../../../core/routes_manager/routes_name.dart';
import '../cubit/register_intent.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const String signUp = 'SignUpPage';
  @override
  State<SignUpPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignUpPage> {
  late RegistrationCubit registrationCubit;
  void initState() {
    super.initState();
    registrationCubit = getIt.get<RegistrationCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<RegistrationCubit, RegistrationState>(
          bloc: registrationCubit,
          listener: (context, state) {
            if (state.status == Status.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.successMessage ?? "Success")));
            } else if (state.status == Status.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error ?? "An error occurred")));
            }
          },
          builder: (context, state) {
            final cubit = registrationCubit;
            return SafeArea(
                child: Padding(
              padding: EdgeInsets.all(15.r),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 20.r,
                        ),
                        Text(
                          "Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20.sp),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: SignField(
                          errorText: cubit.usernameError,
                          controller: cubit.usernameController,
                          hint: "Enter your user name",
                          label: "User name"),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: SignField(
                              errorText: cubit.firstNameError,
                              controller: cubit.firstNameController,
                              hint: "Enter first name",
                              label: "first name"),
                        )),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: SignField(
                              errorText: cubit.lastNameError,
                              controller: cubit.lastNameController,
                              hint: "Enter last name",
                              label: "last name"),
                        )),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: SignField(
                          errorText: cubit.emailError,
                          controller: cubit.emailController,
                          hint: "Enter your Email",
                          label: "Email"),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: SignField(
                              errorText: cubit.passwordError,
                              controller: cubit.passwordController,
                              hint: "Enter password",
                              label: "password"),
                        )),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: SignField(
                              errorText: cubit.rePasswordError,
                              controller: cubit.rePasswordController,
                              hint: "Conirm password",
                              label: "Confirm password"),
                        )),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: SignField(
                          errorText: cubit.phoneError,
                          controller: cubit.phoneController,
                          hint: "Enter phone number",
                          label: "phone number"),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    state.loading
                        ? const CircularProgressIndicator()
                        : InkWell(
                            onTap: () =>
                                cubit.DoIntent(RegisterButtonClicked()),
                            child: const SignButton(),
                          ),
                    Padding(
                      padding: EdgeInsets.all(16.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp),
                          ),
                          InkWell(
                            onTap: () => Navigator.of(context)
                                .pushReplacementNamed(Routes.loginRoute),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  decorationColor: Color(0Xffb02369c),
                                  decorationThickness: 2,
                                  decoration: TextDecoration.underline,
                                  color: Color(0Xffb02369c),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}
