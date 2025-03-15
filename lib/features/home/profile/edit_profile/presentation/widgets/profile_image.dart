import 'package:exam_app/features/home/profile/edit_profile/presentation/widgets/show_model_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/appColor.dart';
import '../cubit/edit_profile_cubit.dart';

Widget buildProfileImage(EditProfileCubit cubit,BuildContext context) {
  return Stack(
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
            child: Icon(Icons.camera_alt_outlined, color: Colors.white, size: 30.r),
          ),
        ),
      ),
    ],
  );
}