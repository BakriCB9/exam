import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/home/profile/edit_profile/domain/entities/show_data_entite.dart';
import 'package:exam_app/features/home/profile/edit_profile/domain/use_cases/show_data_usecase.dart';
import 'package:exam_app/features/register/presentation/cubit/register_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'edit_profile_cubit_state.dart';

@injectable
class   EditProfileCubit extends Cubit<EditProfileState> {
  final ShowDataUseCase showDataUseCase;
  ShowDataEntity? currentUserData;

  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? savedUserName;
  String? savedFirstName;
  String? savedLastName;
  String? savedEmail;
  String? savedPhone;


  EditProfileCubit(this.showDataUseCase)
      : super(EditProfileState(status: StatusEditProfile.loading));

  Future<void> loadProfile() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    savedUserName = prefs.getString('name');
    savedFirstName = prefs.getString('first_name');
    savedLastName = prefs.getString('last_name');
    savedEmail = prefs.getString('email');
    savedPhone = prefs.getString('phone');

    if (savedUserName != null && savedFirstName != null && savedLastName != null && savedEmail != null && savedPhone != null) {
      usernameController.text = savedUserName ?? '';
      firstNameController.text = savedFirstName ?? '';
      lastNameController.text = savedLastName ?? '';
      emailController.text = savedEmail ?? '';
      phoneController.text = savedPhone ?? '';
      emit(state.copyWith(status: StatusEditProfile.success));
    } else {
      await _showData();
    }
  }
  Future<void> _showData() async {
    emit(state.copyWith(status: StatusEditProfile.loading));

    final result = await showDataUseCase.call();
    if (result is SuccessApiResult<Map<String, dynamic>>) {
      print("Successful data fetch");

      if (result.data != null) {
        currentUserData = ShowDataEntity.fromJson(result.data!);
        usernameController.text = currentUserData?.username ?? '';
        firstNameController.text = currentUserData?.firstName ?? '';
        lastNameController.text = currentUserData?.lastName ?? '';
        emailController.text = currentUserData?.email ?? '';
        phoneController.text = currentUserData?.phone ?? '';
        _saveProfile();

        emit(state.copyWith(status: StatusEditProfile.success));
      } else {
        emit(state.copyWith(
          status: StatusEditProfile.error,
          error: "No data received",
        ));
      }
    }
    else if (result is ErrorApiResult) {
      print("Error fetching data: ${result}");
      emit(state.copyWith(
        status: StatusEditProfile.error,
        error: result.toString().replaceFirst('Exception: ', ''),
      ));
    }
  }
  _saveProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', usernameController.text);
    prefs.setString('first_name', firstNameController.text);
    prefs.setString('last_name', lastNameController.text);
    prefs.setString('email', emailController.text);
    prefs.setString('phone', phoneController.text);
      savedUserName=usernameController.text;
      savedFirstName = firstNameController.text;
      savedLastName = lastNameController.text;
      savedEmail = emailController.text;
      savedPhone = phoneController.text;
  }



  void disposeControllers() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
  }
}
