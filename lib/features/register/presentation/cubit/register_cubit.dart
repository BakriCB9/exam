import 'package:exam_app/core/di/api_manger/api_result.dart';
import 'package:exam_app/features/register/domain/entite/user_entite.dart';
import 'package:exam_app/features/register/domain/usecase/register_user.dart';
import 'package:exam_app/features/register/presentation/cubit/cubit_state.dart';
import 'package:exam_app/features/register/presentation/method/extrac_error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegistrationCubit extends Cubit<RegistrationState> {
  final RegisterUser registerUser;

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

  RegistrationCubit(this.registerUser) : super(RegistrationInitial());

  Future<void> register() async {

    emit(RegistrationLoading());
    if (!validateForm()) {
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

       var apiResult = await registerUser.call(user);

       switch(apiResult)
    {


         case SucessApiResult():

           emit(RegistrationSuccess("Registration successful"));
         case ErrorApiResul():

           emit(RegistrationFailure(ErrorApiResul(apiResult.exception).toString()));
       }
}


  bool validateForm() {
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

    emit(RegistrationInitial());
    return isValid;
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
