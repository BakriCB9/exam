import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/home/profile/edit_profile/domain/entities/profile_entity.dart';
import 'package:exam_app/features/home/profile/edit_profile/domain/use_cases/show_data_usecase.dart';
import 'package:exam_app/features/home/profile/edit_profile/domain/use_cases/update_data_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'edit_profile_cubit_state.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  ProfileEntity? currentUserData;
  final ShowDataUseCase showDataUseCase;
  final UpdateDataUsecase updateDataUsecase;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
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

  EditProfileCubit(this.showDataUseCase, this.updateDataUsecase)
      : super(EditProfileState(status: StatusEditProfile.init));

  Future<void> loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    savedUserName = prefs.getString('name');
    savedFirstName = prefs.getString('first_name');
    savedLastName = prefs.getString('last_name');
    savedEmail = prefs.getString('email');
    savedPhone = prefs.getString('phone');

    if (savedUserName != null && savedFirstName != null && savedLastName != null && savedEmail != null && savedPhone != null) {
      // Directly assign saved values to local variables
      username = savedUserName ?? '';
      firstName = savedFirstName ?? '';
      lastName = savedLastName ?? '';
      email = savedEmail ?? '';
      phone = savedPhone ?? '';
      emit(state.copyWith(status: StatusEditProfile.success));
    } else {
      await _showData();
    }
  }

  Future<void> _showData() async {
    final result = await showDataUseCase.call();
    if (result is SuccessApiResult<Map<String, dynamic>>) {
      print("Successful data fetch");
      if (result.data != null) {
        currentUserData = ProfileEntity.fromJson(result.data!);
        username = currentUserData?.username ?? '';
        firstName = currentUserData?.firstName ?? '';
        lastName = currentUserData?.lastName ?? '';
        email = currentUserData?.email ?? '';
        phone = currentUserData?.phone ?? '';
        _saveProfile();
        emit(state.copyWith(status: StatusEditProfile.success));
      } else {
        emit(state.copyWith(
          status: StatusEditProfile.error,
          error: "No data received",
        ));
      }
    } else if (result is ErrorApiResult) {
      print("Error fetching data: ${result}");
      emit(state.copyWith(
        status: StatusEditProfile.error,
        error: result.toString().replaceFirst('Exception: ', ''),
      ));
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

  Future<void> updateProfile() async {
    await loadProfile();
    var updateEmail = emailController.text;
    var updateFirstName = firstNameController.text;
    var updateLastName = lastNameController.text;
    var updatePhone = phoneController.text;
    var updateUserName = usernameController.text;
    if (updateUserName.isEmpty&&updateUserName.isEmpty && updateFirstName.isEmpty && updateLastName.isEmpty && updatePhone.isEmpty) {
      emit(state.copyWith(
        status: StatusEditProfile.error
      ));
      return;
    }
    if(updateEmail.isEmpty) updateEmail=savedEmail!;
    if(updateFirstName.isEmpty) updateFirstName=savedFirstName!;
     if(updateLastName.isEmpty) updateLastName=savedLastName!;
     if(updateUserName.isEmpty) updateUserName=savedUserName!;
     if(updatePhone.isEmpty) updatePhone=savedPhone!;
    ProfileEntity user = ProfileEntity(
      username: updateUserName,
      firstName: updateFirstName,
      lastName: updateLastName,
      email: updateEmail,
      phone: updatePhone,
    );
    final result = await updateDataUsecase(user);
      emit(state.copyWith(
          status: StatusEditProfile.loading
      ));

    switch (result) {
      case SuccessApiResult():
        {
          print("----------------Profile update successful");
          await  Future.delayed(Duration(seconds: 2) ,(){
            emit(state.copyWith(
              successMessage: "Profile update successful",
            ));
          });
          await _showData();
          await  loadProfile();


        }
        break;
      case ErrorApiResult():
        {
          print("============================");
          print(result.exception.toString());
          emit(state.copyWith(
            error: result.exception.toString().replaceFirst('Exception: ', ''),
          ));
        }
        break;
    }
  }
  void disposeControllers() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
  }
}
