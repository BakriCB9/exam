import 'package:exam_app/features/home/profile/edit_profile/presentation/cubit/edit_profile_cubit_state.dart';
import 'package:exam_app/features/home/profile/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:exam_app/features/register/presentation/widgets/sign_button.dart';
import 'package:exam_app/features/register/presentation/widgets/sign_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/di/di.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  @override
  State<ProfileView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProfileView> {
  late EditProfileCubit editProfileCubit;
  void initState() {
    super.initState();
    editProfileCubit = getIt.get<EditProfileCubit>();
    editProfileCubit.loadProfile();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<EditProfileCubit, EditProfileState>(
          bloc: editProfileCubit,
          builder: (context, state) {
            final cubit = editProfileCubit;
            return state.status==StatusEditProfile.loading?
            SafeArea(child: Padding(
              padding:  EdgeInsets.only(top: 350.h),
              child: Center(child: CircularProgressIndicator()),
            )):
            SafeArea(
                child: Padding(
                  padding:  EdgeInsets.all(15.r),
                  child: Form(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 20.r,
                            ),
                            Text(
                              "Profile",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20.sp),
                            ),
                          ],
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 20.h),
                          child: SignField(


                              controller: cubit.usernameController,
                              hint: cubit.savedUserName.toString(), label: "User name"),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                                  padding:  EdgeInsets.only(right: 10.w),
                                  child: SignField(

                                      controller: cubit.firstNameController,
                                      hint: cubit.savedFirstName.toString(), label: "first name"),
                                )),
                            Expanded(
                                child: Padding(
                                  padding:  EdgeInsets.only(left: 10.w),
                                  child: SignField(
                                      controller: cubit.lastNameController,
                                      hint: cubit.savedLastName.toString(), label: "last name"),
                                )),
                          ],
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 20.h),
                          child:
                          SignField(
                              controller: cubit.emailController,
                              hint: cubit.savedEmail.toString(), label: "Email"),
                        ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical:16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.black54,
                        width: 1.8,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          size: 20,
                          Icons.star,
                          color: Colors.black54,
                        ),
                        Icon(
                          size: 20,

                          Icons.star,
                          color: Colors.black54,
                        ),
                        Icon(
                          size: 20,

                          Icons.star,
                          color: Colors.black54,
                        ),
                        Icon(
                          size: 20,

                          Icons.star,
                          color: Colors.black54,
                        ),
                        Icon(
                          size: 20,

                          Icons.star,
                          color: Colors.black54,
                        ),
                        Icon(
                          size: 20,

                          Icons.star,
                          color: Colors.black54,
                        ),


                      ],
                    ),
                  ),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 20.h),
                          child: SignField(
                              controller: cubit.phoneController,
                              hint: cubit.savedPhone.toString(), label: "phone number"),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        state.status==StatusEditProfile.success? InkWell(
                            onTap: ()=>cubit.updateProfile(),
                            child: const SignButton(text: "Update"))
                            :InkWell(
                            child: const SignButton(text: "Update"))
                      ],
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
