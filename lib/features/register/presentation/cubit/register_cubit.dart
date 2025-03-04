import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/register/presentation/cubit/register_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entite/user_entite.dart';
import '../../domain/usecase/register_user.dart';
import 'cubit_state.dart';

@injectable
class RegistrationCubit extends Cubit<RegistrationState> {
  final RegisterUser registerUser;
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? usernameError;
  String? firstNameError;
  String? lastNameError;
  String? emailError;
  String? passwordError;
  String? rePasswordError;
  String? phoneError;

  RegistrationCubit(this.registerUser) : super(RegistrationState(status:Status.loading,loading: false));
  Future<void> _register() async {
    if (!_validateForm()) {
      return;
    }

    final user = UserEntite(
      username: usernameController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
      rePassword: rePasswordController.text,
    );


      emit(state.copyWith(status: Status.loading, loading: true));

      final result = await registerUser(user);

      switch(result)
    {
        case SuccessApiResult():{
          emit(state.copyWith(status: Status.success, successMessage: "Registration successful", loading: false));

        }
        case ErrorApiResult():{
          emit(state.copyWith(status: Status.error, error:result.exception.toString().replaceFirst('Exception: ', ''), loading: false));

        }
       }

  }

  bool _validateForm() {
    bool isValid = true;

    usernameError = null;
    firstNameError = null;
    lastNameError = null;
    emailError = null;
    passwordError = null;
    rePasswordError = null;
    phoneError = null;

    if (usernameController.text.isEmpty) {
      usernameError = "user name cannot be empty";
      isValid = false;
    }
    if (firstNameController.text.isEmpty) {
      firstNameError = "First Name cannot be empty";
      isValid = false;
    }
    if (lastNameController.text.isEmpty) {
      lastNameError = "Last Name cannot be empty";
      isValid = false;
    }
    if (emailController.text.isEmpty || !RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(emailController.text)) {
      emailError = "Enter a valid email address";
      isValid = false;
    }
    if (passwordController.text.isEmpty || passwordController.text.length < 6) {
      passwordError = "Password not valid";
      isValid = false;
    }
    if (passwordController.text != rePasswordController.text) {
      rePasswordError = "Passwords do not match";
      isValid = false;
    }
    if (phoneController.text.isEmpty) {
      phoneError = "Phone number cannot be empty";
      isValid = false;
    }
    if (rePasswordController.text.isEmpty ) {
      rePasswordError = "confirm password not valid";
      isValid = false;
    }


    return isValid;
  }


DoIntent (RegisterIntent registerIntent)
{
  switch (registerIntent) {
    case RegisterButtonClicked():
      {
    _register();

      }

    case NavigateToLoginPageClicked():
      {


      }
  }
}


  void disposeControllers() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    phoneController.dispose();
  }

}
