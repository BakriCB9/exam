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
import '../widgets/text_fileld.dart';
import '../../../../../../core/widgets/title widget.dart';
import '../widgets/update_button.dart';
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
            return   state.status == StatusEditProfile.loadingCahngePassword
                ? buildLoadingState():  _buildPasswordForm();
          },
        ),
      ),
    );
  }


  Widget _buildPasswordForm() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(15.r),
        child: Form(
          child: Column(
            children: [
              Row(children: [buildButton( icon: Icons.arrow_back_ios_new_outlined, ontab: () { Navigator.of(context).pop(); }), buildTitle("Reset Password"),],),
              buildTextField(controller: editProfileCubit.currentPasswordController, hint: "Current password", label: "Current password"),
              buildTextField(controller: editProfileCubit.newPasswordController, hint: "New password", label: "New password"),
              buildTextField(controller: editProfileCubit.confirmPasswordController, hint: "Confirm password", label: "Confirm password"),
              ReusableButton(text: 'Update', color: AppColor.blue60, onTap: () { editProfileCubit.changePassword(); },),
            ],
          ),
        ),
      ),
    );
  }
}



