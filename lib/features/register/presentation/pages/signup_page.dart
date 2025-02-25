import 'package:exam_app/features/register/presentation/cubit/cubit_state.dart';
import 'package:exam_app/features/register/presentation/cubit/register_cubit.dart';
import 'package:exam_app/features/register/presentation/widgets/sign_button.dart';
import 'package:exam_app/features/register/presentation/widgets/sign_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

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
             if (state is RegistrationSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is RegistrationFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
            }

          },
          builder: (context, state) {
             final cubit = registrationCubit;
             bool isLoading = state is RegistrationLoading;
            return SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                        ),
                        Text(
                          "Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SignField(

                          errorText: cubit.usernameError,

                        controller: cubit.usernameController,
                          hint: "Enter your user name", label: "User name"),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SignField(
                              errorText: cubit.firstNameError,

                            controller: cubit.firstNameController,
                              hint: "Enter first name", label: "first name"),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SignField(
                             errorText: cubit.lastNameError,
                            controller: cubit.lastNameController,
                              hint: "Enter last name", label: "last name"),
                        )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child:
                          SignField(
                            errorText: cubit.emailError,
                            controller: cubit.emailController,
                            hint: "Enter your Email", label: "Email"),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SignField(
                          errorText: cubit.passwordError,
                            controller: cubit.passwordController,
                              hint: "Enter password", label: "password"),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SignField(
                            errorText: cubit.rePasswordError,
                            controller: cubit.rePasswordController,
                              hint: "Conirm password",
                              label: "Confirm password"),
                        )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SignField(
                      errorText: cubit.phoneError,
                        controller: cubit.phoneController,
                          hint: "Enter phone number", label: "phone number"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                   isLoading
                  ? const CircularProgressIndicator()
                  : InkWell(
                      onTap: () => cubit.register(),
                      child: const SignButton(),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          Text(
                            "Login",
                            style: TextStyle(
                                decorationColor: Color(0Xffb02369c),
                                decorationThickness: 2,
                                decoration: TextDecoration.underline,
                                color: Color(0Xffb02369c),
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
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
