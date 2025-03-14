import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildLoadingState() {
  return SafeArea(
    child: Padding(
      padding: EdgeInsets.only(top: 350.h),
      child: Center(child: CircularProgressIndicator()),
    ),
  );
}
