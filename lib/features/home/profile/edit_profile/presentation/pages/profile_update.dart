import 'package:exam_app/config/appColor.dart';
import 'package:exam_app/features/home/profile/edit_profile/presentation/cubit/edit_profile_cubit_state.dart';
import 'package:exam_app/features/home/profile/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:exam_app/features/home/profile/edit_profile/presentation/widgets/show_model_bottom_sheet.dart';
import 'package:exam_app/features/register/presentation/widgets/sign_button.dart';
import 'package:exam_app/features/register/presentation/widgets/sign_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/di/di.dart';
import '../../../../../../core/routes_manager/routes_name.dart';
import '../widgets/loading_state.dart';
import '../widgets/password_field.dart';
import '../widgets/update_button.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({super.key});

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
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
            if (state.status == StatusEditProfile.SuccessUpdateProfile) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Updated successfully')),
              );

              Navigator.of(context).pushNamed(Routes.profileViewRoute);
            } else if (state.status == StatusEditProfile.errorGetData) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Something went wrong")),
              );
            } else if (state.status == StatusEditProfile.erorrUpdateProfile) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error.toString())),
              );
            } else if (state.status == StatusEditProfile.errorFormIsEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Form cannot be empty")),
              );
            }
          },
          builder: (context, state) {
            final cubit = editProfileCubit;
            return state.status == StatusEditProfile.loading
                ? buildLoadingState()
                : _buildProfileUpdateForm(cubit);
          },
        ),
      ),
    );
  }

  Widget _buildProfileUpdateForm(EditProfileCubit cubit) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(15.r),
        child: Form(
          child: Column(
            children: [
              Row(
                children: [
                  _buildBackButton(),
                    _buildProfileTitle(),
                ],
              ),
              

               Stack(
              alignment: Alignment.bottomRight, 
              children: [
                cubit.image == null
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('asset/images/profile.png'),
                      )
                    : CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(cubit.image!),
                      ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () => ShowModelBottomSheet(cubit,context),
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
              _buildProfileField(cubit.usernameController, cubit.savedUserName, "User name"),
              _buildNameFields(cubit),
              _buildProfileField(cubit.emailController, cubit.savedEmail, "Email"),
             Stack(children:[ 
          
         
          buildPasswordField(),
          
           Positioned(
            right: 20,
            bottom: 17,
            child: InkWell(
              onTap: () => Navigator.of(context).pushNamed(Routes.changePasswordRoute),
              child: Text("change",style: TextStyle(color: AppColor.blue60,fontWeight: FontWeight.bold),)),
          ),]),

              _buildProfileField(cubit.phoneController, cubit.savedPhone, "Phone number"),
              SizedBox(height: 30.h),
              ReusableButton(onTap: () {
                cubit.updateProfile();
              }, text: 'Update', color: AppColor.blue60,cubit: cubit,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Back Button
  Widget _buildBackButton() {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios,
            size: 20.r,
          ),
        ),
      ],
    );
  }

  // Profile Title
  Widget _buildProfileTitle() {
    return Row(
      children: [
        Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
        ),
      ],
    );
  }

  // Reusable Profile Field (TextField)
  Widget _buildProfileField(TextEditingController controller, String? hint, String label) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: SignField(
        controller: controller,
        hint: hint ?? '',
        label: label,
      ),
    );
  }

  // Reusable Name Fields (First Name and Last Name)
  Widget _buildNameFields(EditProfileCubit cubit) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: SignField(
              controller: cubit.firstNameController,
              hint: cubit.savedFirstName ?? '',
              label: "First name",
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: SignField(
              controller: cubit.lastNameController,
              hint: cubit.savedLastName ?? '',
              label: "Last name",
            ),
          ),
        ),
      ],
    );
  }


}
