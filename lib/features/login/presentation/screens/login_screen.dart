import 'package:exam_app/core/di/di.dart';
import 'package:exam_app/core/widgets/custom_text_form_field.dart';
import 'package:exam_app/features/auth/data/model/loginModel.dart';
import 'package:exam_app/features/auth/presentation/cubit/cubit/login_cubit.dart';
import 'package:exam_app/features/auth/presentation/cubit/cubit/login_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormState> formkey;
  late LoginCubit loginCubit;
  @override
  void initState() {
    super.initState();
    formkey = GlobalKey<FormState>();
    loginCubit = getIt.get<LoginCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: BlocListener<LoginCubit, LoginState>(
          bloc: loginCubit,
          listener: (context, state) {
            switch (state) {
              case LoginStateLoading():
                print('Loddddddddddddddddddddddddddddddddiiinggggg');
              case LoginStateSuccess():
                //Toast.show(state.message);
                print('yes we do it now ');
              case LoginStateError():
                // Toast.show(state.message);

                print('faillllllllllllllllllllllllllllllll');
              case LoginStateInit():
              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>));
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Form(
                    key: formkey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                            label: 'Email',
                            hintText: 'Enter the email',
                            controllerText: loginCubit.emailController),
                        const SizedBox(height: 24),
                        CustomTextFormField(
                            label: 'Password',
                            hintText: 'Enter the password',
                            controllerText: loginCubit.passwordController),
                      ],
                    )),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Checkbox(value: false, onChanged: (_) {}),
                          const Text('Remember me')
                        ],
                      ),
                    ),
                    const Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forget Password?',
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                            )))
                  ],
                ),
                const SizedBox(height: 80),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!formkey.currentState!.validate()) {
                        return;
                      }
                      loginCubit.login(LoginRequestModel(
                          email: loginCubit.emailController.text,
                          password: loginCubit.passwordController.text));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF02369C)),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Don\'t have an account?  ',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFF0F0F0F))),
                    TextSpan(
                        text: 'Sign up',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF02369C),
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('some thing happen ');
                          }),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
