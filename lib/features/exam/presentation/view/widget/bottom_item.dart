import 'package:exam_app/config/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomItem extends StatelessWidget {
  final int currentindex;
  final int index;
  final String icon;
  const CustomBottomItem(
      {required this.index,
      required this.currentindex,
      required this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: currentindex == index
          ? BoxDecoration(
              color: AppColor.blue10, borderRadius: BorderRadius.circular(20.r))
          : null,
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
      child: Image.asset(icon),
    );
  }
}
