import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildButton({required IconData icon,required void Function() ontab}) {
  return Row(
    children: [
      InkWell(
        onTap: ontab,
        child: Icon(icon, size: 20.r),
      ),
    ],
  );
}