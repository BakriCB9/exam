import 'package:exam_app/features/home/profile/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/sign_field.dart';

import "package:flutter/material.dart";
Widget buildNameFields(EditProfileCubit editProfileCubit,bool enabled ) {
  return Row(
    children: [
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: SignField(
            enabled: enabled,
            controller: editProfileCubit.firstNameController,
            hint: editProfileCubit.savedFirstName ?? '',
            label: "First name",
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: SignField(
            enabled: enabled,
            controller: editProfileCubit.lastNameController,
            hint: editProfileCubit.savedLastName ?? '',
            label: "Last name",
          ),
        ),
      ),
    ],
  );
}
