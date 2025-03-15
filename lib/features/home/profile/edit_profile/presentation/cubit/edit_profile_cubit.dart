import 'dart:io';

import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/core/local_secure_storage/flutter_secure_storage.dart';
import 'package:exam_app/features/home/profile/edit_profile/domain/entities/profile_entity.dart';
import 'package:exam_app/features/home/profile/edit_profile/domain/use_cases/change_passwod_usecase.dart';
import 'package:exam_app/features/home/profile/edit_profile/domain/use_cases/show_data_usecase.dart';
import 'package:exam_app/features/home/profile/edit_profile/domain/use_cases/update_data_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../config/constants.dart';
import '../../domain/use_cases/logout_usecase.dart';
import 'edit_profile_cubit_state.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  ProfileEntity? currentUserData;
  final ShowDataUseCase showDataUseCase;
  final UpdateDataUsecase updateDataUsecase;
  final ChangePasswordUseCase changePasswordUseCase;
  final LogoutUseCase logoutUseCase;
  final LocalStroage localStroage;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? image;
  String username = '';
  String firstName = '';
  String lastName = '';
  String email = '';
  String phone = '';
  String? savedUserName;
  String? savedFirstName;
  String? savedLastName;
  String? savedEmail;
  String? savedPhone;
  String? updateUserName;
  String? updateFirstName;
  String? updateLastName;
  String? updateEmail;
  String? updatePhone;

  EditProfileCubit(
      this.showDataUseCase,
      this.updateDataUsecase,
      this.changePasswordUseCase,
      this.logoutUseCase,
      this.localStroage,
      ) : super(EditProfileState(status: StatusEditProfile.loading));

  Future<void> loadProfile() async {
    emit(state.copyWith(status: StatusEditProfile.loading));

    SharedPreferences prefs = await SharedPreferences.getInstance();
      savedUserName = prefs.getString('name');
      savedFirstName = prefs.getString('first_name');
      savedLastName = prefs.getString('last_name');
      savedEmail = prefs.getString('email');
      savedPhone = prefs.getString('phone');

      if (savedUserName != null && savedFirstName != null && savedLastName != null && savedEmail != null && savedPhone != null) {
        username = savedUserName ?? '';
        firstName = savedFirstName ?? '';
        lastName = savedLastName ?? '';
        email = savedEmail ?? '';
        phone = savedPhone ?? '';

        emit(state.copyWith(status: StatusEditProfile.successLoadProfile));
      } else {
        await getData();
      }

  }

  Future<void> getData() async {
    final result = await showDataUseCase.call();
    emit(state.copyWith(status: StatusEditProfile.loading));

    if (result is SuccessApiResult<Map<String, dynamic>>) {
      if (result.data != null) {
        currentUserData = ProfileEntity.fromJson(result.data!);
        username = currentUserData?.username ?? '';
        firstName = currentUserData?.firstName ?? '';
        lastName = currentUserData?.lastName ?? '';
        email = currentUserData?.email ?? '';
        phone = currentUserData?.phone ?? '';
        await _saveProfile();
        await Future.delayed(Duration(seconds: 1), () {
          emit(state.copyWith(status: StatusEditProfile.SuccessChangePassword));
        });
      } else {
        await Future.delayed(Duration(seconds: 1), () {
          emit(state.copyWith(status: StatusEditProfile.errorGetData, error: "No data received"));
        });
      }
    } else if (result is ErrorApiResult) {
      await Future.delayed(Duration(seconds: 1), () {
        emit(state.copyWith(status: StatusEditProfile.errorGetData, error: result.toString().replaceFirst('Exception: ', '')));
      });
    }
  }

  _saveProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', username);
    prefs.setString('first_name', firstName);
    prefs.setString('last_name', lastName);
    prefs.setString('email', email);
    prefs.setString('phone', phone);
    savedUserName = username;
    savedFirstName = firstName;
    savedLastName = lastName;
    savedEmail = email;
    savedPhone = phone;
  }

  removeProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('name');
    prefs.remove('first_name');
    prefs.remove('last_name');
    prefs.remove('email');
    prefs.remove('phone');
  }

  Future<void> updateProfile() async {
    var updateEmail = emailController.text;
    var updateFirstName = firstNameController.text;
    var updateLastName = lastNameController.text;
    var updatePhone = phoneController.text;
    var updateUserName = usernameController.text;

    if (updateUserName.isEmpty && updateFirstName.isEmpty &&
        updateLastName.isEmpty && updatePhone.isEmpty && updateEmail.isEmpty) {
      emit(state.copyWith(status: StatusEditProfile.errorFormIsEmpty));
      return;
    }

    if (updateEmail.isEmpty) updateEmail = savedEmail!;
    if (updateFirstName.isEmpty) updateFirstName = savedFirstName!;
    if (updateLastName.isEmpty) updateLastName = savedLastName!;
    if (updateUserName.isEmpty) updateUserName = savedUserName!;
    if (updatePhone.isEmpty) updatePhone = savedPhone!;

    ProfileEntity user = ProfileEntity(
      username: updateUserName,
      firstName: updateFirstName,
      lastName: updateLastName,
      email: updateEmail,
      phone: updatePhone,
    );

    final result = await updateDataUsecase(user);
    emit(state.copyWith(status: StatusEditProfile.loading));

    switch (result) {
      case SuccessApiResult():
        username = updateUserName;
        firstName = updateFirstName;
        lastName = updateLastName;
        email = updateEmail;
        phone = updatePhone;
        _saveProfile();
        clearControllers();
        await Future.delayed(Duration(seconds: 1), () {
          emit(state.copyWith(
            status: StatusEditProfile.SuccessUpdateProfile,
            successMessage: "Profile updated successfully",
          ));
        });
        break;
      case ErrorApiResult():
        String error = result.exception.toString().replaceFirst('Exception: ', '');
        if (error.contains('E11000')) {
          error = error.contains('username') ? 'Username already exists' : 'Email already exists';
        } else if (error.contains("pattern")) {
          error = "Please enter a valid phone number";
        } else {
          error = 'An error occurred: $error';
        }
        await Future.delayed(Duration(seconds: 1), () {
          emit(state.copyWith(
            status: StatusEditProfile.erorrUpdateProfile,
            error: error,
          ));
        });
        break;
    }
  }

  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    emit(state.copyWith(status: StatusEditProfile.pickImageFromGallery));
  }

  Future<void> pickImageFromCamera() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    emit(state.copyWith(status: StatusEditProfile.pickImageFromCamera));
  }

  Future<void> requestPermissions() async {
    if (await Permission.camera.request().isGranted) {
      pickImageFromCamera();
    } else {
      print("Camera permission denied");
    }

    if (await Permission.storage.request().isGranted) {
      pickImageFromGallery();
    } else {
      print("Storage permission denied");
    }
  }

  Future<void> changePassword() async {
    emit(state.copyWith(status: StatusEditProfile.loadingCahngePassword));
    String oldPassword = currentPasswordController.text;
    String newPassword = newPasswordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (newPassword != confirmPassword) {
      emit(state.copyWith(status: StatusEditProfile.errorMatchedPassword));
      return;
    }

    final result = await changePasswordUseCase.execute(oldPassword, newPassword);
    if (result is SuccessApiResult) {
      await removeProfile();
      await Future.delayed(Duration(seconds: 1), () {
        emit(state.copyWith(status: StatusEditProfile.SuccessChangePassword));
      });
    } else if (result is ErrorApiResult) {
      ErrorApiResult errorResult = result as ErrorApiResult;
      String? errorMessage = errorResult.exception.toString().replaceFirst("Exception:", "");
      if (oldPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
        errorMessage = "Fields cannot be empty";
      } else if (errorMessage == "invalid token .. login again") {
        errorMessage = "Please login again";
      } else if (validatePassword(oldPassword) != null) {
        errorMessage = "Old password not correct";
      } else if (validatePassword(newPassword) != null) {
        errorMessage = validatePassword(newPassword);
      }
      await Future.delayed(Duration(seconds: 1), () {
        emit(state.copyWith(
          status: StatusEditProfile.errorCahngePassword,
          error: errorMessage,
        ));
      });
    }
  }

  String? validatePassword(String password) {
    String pattern = r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-_]).{8,}$";
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(password)) {
      return 'Password must have at least 8 characters, one uppercase letter, one lowercase letter, one number, and one special character (including _).';
    }
    return null;
  }

  Future<void> logOut() async {
    emit(EditProfileState(status: StatusEditProfile.loading));
    await removeProfile();
    localStroage.removeToken(key: AppCashConstant.token);
    emit(EditProfileState(status: StatusEditProfile.successLogOut));
  }

  void clearControllers() {
    emailController.clear();
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
    usernameController.clear();
  }

  void disposeControllers() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
  }
}
