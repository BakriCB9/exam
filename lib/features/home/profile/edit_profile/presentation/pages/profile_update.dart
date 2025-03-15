import 'package:exam_app/config/appColor.dart';
import 'package:exam_app/features/home/profile/edit_profile/presentation/cubit/edit_profile_cubit_state.dart';
import 'package:exam_app/features/home/profile/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../core/routes_manager/routes_name.dart';
import '../../../../../../core/widgets/button_click.dart';
import '../../../../../../core/widgets/loading_state.dart';
import '../widgets/name_fields.dart';
import '../widgets/password_field.dart';
import '../widgets/profile_image.dart';
import '../widgets/text_fileld.dart';
import '../../../../../../core/widgets/title widget.dart';
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
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Updated successfully')));
              Navigator.of(context).pushNamed(Routes.profileViewRoute);
            } else if (state.status == StatusEditProfile.errorGetData) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong")));
            } else if (state.status == StatusEditProfile.erorrUpdateProfile) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error.toString())));
            }
          },
          builder: (context, state) {
            return state.status == StatusEditProfile.loading
                ? buildLoadingState()
                : _buildProfileUpdateForm();
          },
        ),
      ),
    );
  }

  Widget _buildProfileUpdateForm() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.r),
          child: Form(
            child: Column(
              children: [
                Row(children: [buildButton( icon: Icons.arrow_back_ios_new_outlined, ontab: () { Navigator.of(context).pop(); }), buildTitle("Edit Profile"),],),
                buildProfileImage(editProfileCubit,context),
                buildTextField(controller: editProfileCubit.usernameController, hint: editProfileCubit.savedUserName ?? '', label: "User name"),
                buildNameFields(editProfileCubit,true),
                buildTextField(controller: editProfileCubit.emailController, hint: editProfileCubit.savedEmail ?? '', label: "Email"),
                buildPasswordField(context),
                buildTextField(
                    controller: editProfileCubit.phoneController, hint: editProfileCubit.savedPhone ?? '', label: "Phone"),
                ReusableButton(text: 'Update', color: AppColor.blue60, onTap: () { editProfileCubit.updateProfile(); },),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
