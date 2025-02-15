import 'package:exam_app/features/register/domain/entite/user_entite.dart';
import 'package:exam_app/features/register/domain/usecase/register_user.dart';
import 'package:exam_app/features/register/presentation/cubit/cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final RegisterUser registerUser;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Track errors for each field
  String? usernameError;
  String? firstNameError;
  String? lastNameError;
  String? emailError;
  String? passwordError;
  String? rePasswordError;
  String? phoneError;

  RegistrationCubit(this.registerUser) : super(RegistrationInitial());

  Future<void> register() async {
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
String extractErrorMessage(String error) {
  RegExp regExp = RegExp(r'message:\s*([^,}]+)'); 
  
  final match = regExp.firstMatch(error);
  
  if (match != null && match.group(1) != null) {
    return match.group(1)!.trim(); 
  }
  
  return "failed registrtion"; 
}





try {
  await registerUser(user);
  emit(RegistrationSuccess("Registration successful"));
} catch (e) {
  String errorMessage = e.toString();
  
  String extractedMessage = extractErrorMessage(errorMessage);

  emit(RegistrationFailure("Registration failed: $extractedMessage"));
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
