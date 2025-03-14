import 'package:exam_app/core/routes_manager/routes_name.dart';
import 'package:exam_app/features/home/profile/edit_profile/presentation/cubit/edit_profile_cubit_state.dart';
import 'package:exam_app/features/home/profile/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:exam_app/features/home/profile/edit_profile/presentation/widgets/show_model_bottom_sheet.dart';
import 'package:exam_app/features/register/presentation/widgets/sign_button.dart';
import 'package:exam_app/features/register/presentation/widgets/sign_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../config/appColor.dart';
import '../../../../../../core/di/di.dart';
import '../widgets/loading_state.dart';
import '../widgets/password_field.dart';
import '../widgets/title widget.dart';
import '../widgets/update_button.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PasswordView extends StatefulWidget {
  const PasswordView({super.key});
  @override
  State<PasswordView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PasswordView> {
  late EditProfileCubit editProfileCubit;

  @override
  void initState() {
    super.initState();
    editProfileCubit = getIt.get<EditProfileCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<EditProfileCubit, EditProfileState>(
          bloc: editProfileCubit,
          listener: (context, state) {
            if (state.status == StatusEditProfile.SuccessChangePassword) {
              Navigator.of(context).pushNamed(Routes.loginRoute);
            } else if (state.status == StatusEditProfile.errorCahngePassword) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error.toString())),
              );
            }
            else if (state.status == StatusEditProfile.errorMatchedPassword) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("password not matched")),
              );
            }
          },
          builder: (context, state) {
            final cubit = editProfileCubit;
            return   state.status == StatusEditProfile.loadingCahngePassword
                ? buildLoadingState(): _buildProfileForm(cubit);
          },
        ),
      ),
    );
  }


  // Main Profile Form
 Widget _buildProfileForm(EditProfileCubit cubit) {
  return SafeArea(
    child: Padding(
      padding: EdgeInsets.all(15.r),
      child: Form(
        child: Column(
          children: [

         Row(

           children: [

             InkWell(
                 onTap: ()=> Navigator.of(context).pushNamed(Routes.profileViewRoute),
                 child: Icon(Icons.arrow_back_ios_new_outlined)),
             buildTitle("Reset password"),
           ],
         ),
            _buildUserInformation(cubit),
            SizedBox(height: 40.h,),
            ReusableButton(
              onTap: () {
              cubit.changePassword();
              },
              text: 'Update',
              color: AppColor.black30,
            ),
          ],
        ),
      ),
    ),
  );
}
  Widget _buildUserInformation(EditProfileCubit cubit) {
    return Column(
      children: [
        _buildTextField(
          controller: cubit.currentPasswordController,
          hint: "Current password",
          label: "Current password",
        ),
        _buildTextField(
          controller: cubit.newPasswordController,
          hint:  "New password",
          label: "New password",
        ),
        _buildTextField(
          controller: cubit.confirmPasswordController,
          hint: "Confirm password",
          label: "Confirm password",
        ),




      ],
    );
  }
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required String label,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: SignField(
        enabled: true,
        controller: controller,
        hint: hint,
        label: label,
      ),
    );
  }





}