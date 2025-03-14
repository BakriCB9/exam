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

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  @override
  State<ProfileView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProfileView> {
  late EditProfileCubit editProfileCubit;

  @override
  void initState() {
    super.initState();
    editProfileCubit = getIt.get<EditProfileCubit>();
    editProfileCubit.loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<EditProfileCubit, EditProfileState>(
          bloc: editProfileCubit,
          listener: (context, state) {
            if (state.status == StatusEditProfile.loadingGetData) {
              print("Loading data...");
            } else if (state.status == StatusEditProfile.successLoadProfile) {
              print("Profile loaded successfully.");
            }
          },
          builder: (context, state) {
            final cubit = editProfileCubit;
            // Show a loading indicator until profile data is loaded
            if (state.status == StatusEditProfile.loadingProfile) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status == StatusEditProfile.successLoadProfile) {
              return _buildProfileForm(cubit);
            } else {
              // Handle other states if needed
              return Center(
                child: Text('Failed to load profile'),
              );
            }
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
              buildTitle("Profile"),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  if (cubit.image == null)
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('asset/images/profile.png'),
                    )
                  else
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(cubit.image!),
                    ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () => ShowModelBottomSheet(cubit, context),
                      child: Container(
                        width: 35.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: AppColor.blue40,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 30.r,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildUserInformation(cubit),
              _buildPhoneField(cubit),
              SizedBox(height: 15.h),
              ReusableButton(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.profileUpdateRoute);
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

  // Profile Title

  // User Information Fields (Username, First Name, Last Name, Email)
  Widget _buildUserInformation(EditProfileCubit cubit) {
    return Column(
      children: [
        _buildTextField(
          controller: cubit.usernameController,
          hint: cubit.savedUserName.toString(),
          label: "User name",
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: _buildTextField(
                  controller: cubit.firstNameController,
                  hint: cubit.savedFirstName.toString(),
                  label: "First Name",
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: _buildTextField(
                  controller: cubit.lastNameController,
                  hint: cubit.savedLastName.toString(),
                  label: "Last Name",
                ),
              ),
            ),
          ],
        ),
        _buildTextField(
          controller: cubit.emailController,
          hint: cubit.savedEmail.toString(),
          label: "Email",
        ),
        Stack(children: [
          buildPasswordField(),
          Positioned(
            right: 20,
            bottom: 17,
            child: InkWell(
              onTap: () =>
                  Navigator.of(context).pushNamed(Routes.changePasswordRoute),
              child: Text(
                "change",
                style: TextStyle(color: AppColor.blue60, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ]),
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
        enabled: false,
        controller: controller,
        hint: hint,
        label: label,
      ),
    );
  }

  Widget _buildPhoneField(EditProfileCubit cubit) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: _buildTextField(
        controller: cubit.phoneController,
        hint: cubit.savedPhone.toString(),
        label: "Phone number",
      ),
    );
  }
}
