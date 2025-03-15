import 'package:exam_app/core/widgets/custom_text_form_field.dart';
import 'package:exam_app/features/login/presentation/cubit/cubit/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di.dart';
import '../../../../home/profile/edit_profile/presentation/widgets/text_fileld.dart';
import '../../cubit/cubit/forgot_password_state.dart';

class ForgetPasswordScreen extends StatefulWidget {
  ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late ForgotPasswordCubit forgotPasswordCubit;

  @override
  void initState() {
    super.initState();
    forgotPasswordCubit = getIt.get<ForgotPasswordCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Password',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: "Inter",
          ),
        ),
      ),
      body: BlocProvider<ForgotPasswordCubit>(
        create: (_) => forgotPasswordCubit,
        child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
          listener: (context, state) {
            if (state.status == StatusForgetPassword.loading) {
              showDialog(
                context: context,
                builder: (context) => const Center(child: CircularProgressIndicator()),
              );
            } else {
              // Dismiss the loading dialog when state changes to success or error
              Navigator.of(context, rootNavigator: true).pop();
            }

            if (state.status == StatusForgetPassword.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Success!")),
              );
              // Optionally, navigate to a different screen upon success
              // Navigator.pushReplacementNamed(context, '/success');
            } else if (state.status == StatusForgetPassword.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error.toString())),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: ListView(
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Forget Password',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Please enter your email associated with your account',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                buildTextField(
                  controller: forgotPasswordCubit.emailController,
                  hint: "Enter your email",
                  label: "User name",
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Get the email from the controller and pass it to forgotPassword
                    final email = forgotPasswordCubit.emailController.text;
                    forgotPasswordCubit.forgotPassword(email);
                  },
                  child: const Text('Continue'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
