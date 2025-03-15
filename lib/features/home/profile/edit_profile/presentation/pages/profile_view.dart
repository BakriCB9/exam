import 'package:exam_app/core/routes_manager/routes_name.dart';
import 'package:exam_app/features/home/profile/edit_profile/presentation/cubit/edit_profile_cubit_state.dart';
import 'package:exam_app/features/home/profile/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../config/appColor.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../core/widgets/button_click.dart';
import '../../../../../../core/widgets/loading_state.dart';
import '../widgets/name_fields.dart';
import '../widgets/password_field.dart';
import '../widgets/profile_image.dart';
import '../widgets/text_fileld.dart';
import '../../../../../../core/widgets/title widget.dart';
import '../widgets/update_button.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
            if (state.status == StatusEditProfile.successLogOut) {
              Navigator.of(context).pushNamed(Routes.loginRoute);
            }
          },
          builder: (context, state) {
            if (state.status == StatusEditProfile.loading) {
              return buildLoadingState();
            } else {
              return _buildProfileForm();
            }
          },
        ),
      ),
    );
  }

  Widget _buildProfileForm() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.r),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildTitle("Profile"),
                  buildButton( icon: Icons.logout_outlined, ontab: () {editProfileCubit.logOut(); })
                ],
              ),
              buildProfileImage(editProfileCubit,context),
              buildTextField(enabled: false, controller: editProfileCubit.usernameController, hint: editProfileCubit.savedUserName ?? '', label: "User name"),
              buildNameFields(editProfileCubit,false),
              buildTextField(enabled:false,controller: editProfileCubit.emailController, hint: editProfileCubit.savedEmail ?? '', label: "Email"),
              buildPasswordField(context),
              buildTextField(enabled: false,controller: editProfileCubit.phoneController, hint: editProfileCubit.savedPhone ?? '', label: "Phone"),
      
              ReusableButton(text: 'Update', color: AppColor.black30, onTap: () {  Navigator.of(context).pushNamed(Routes.profileUpdateRoute); },),
            ],
          ),
        ),
      ),
    );
  }
}

