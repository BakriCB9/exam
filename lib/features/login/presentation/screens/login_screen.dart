import 'package:exam_app/config/appColor.dart';
import 'package:exam_app/config/appString.dart';
import 'package:exam_app/core/di/di.dart';
import 'package:exam_app/core/validate/validate.dart';
import 'package:exam_app/core/widgets/custom_text_form_field.dart';
import 'package:exam_app/core/widgets/ui_utils.dart';
import 'package:exam_app/features/login/data/model/loginModel.dart';
import 'package:exam_app/features/login/presentation/cubit/cubit/login_cubit.dart';
import 'package:exam_app/features/login/presentation/cubit/cubit/login_state.dart';
import 'package:exam_app/features/login/presentation/screens/widget/custom_checkBox.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: BlocListener<LoginCubit, LoginState>(
          bloc: loginCubit,
          listener: (context, state) {
            switch (state) {
              case LoginStateLoading():
                UiUtils.showLoading(context);

              case LoginStateSuccess():
                UiUtils.hideLoading(context);

              case LoginStateError():
                UiUtils.hideLoading(context);
                UiUtils.showToastMessage(state.message);

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
                            validate: (value) => checkValidatEmail(value),
                            label: AppString.email,
                            hintText: AppString.enterTheEmail,
                            controllerText: loginCubit.emailController),
                        const SizedBox(height: 24),
                        CustomTextFormField(
                            validate: (value) => checkValidatePassword(value),
                            label: AppString.password,
                            hintText: AppString.enterThePassword,
                            controllerText: loginCubit.passwordController),
                      ],
                    )),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(child: CustomCheckBox()),
                    Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              AppString.forgetPasword,
                              style: theme.bodySmall?.copyWith(
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
                      AppString.login,
                      style: theme.bodyMedium?.copyWith(color: AppColor.white),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: AppString.dontHaveAccount,
                        style: theme.bodyMedium),
                    TextSpan(
                        text: AppString.signUp,
                        style: theme.bodyMedium?.copyWith(
                            color: AppColor.blueBase,
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

String? checkValidatEmail(value) {
  if (Validator.isEmail(value)) {
    return null;
  }
  return 'Your Email isn\'t correct';
}

String? checkValidatePassword(value) {
  if (!Validator.hasMinLength(value, minLength: 8)) {
    return 'Your password must at least 8 character';
  }
  if (!Validator.isPassword(value)) {
    return "Your password in Correct";
  }
  return null;
}
