import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildTitle(String title) {
  return Row(
    children: [
      Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
      ),
    ],
  );
}