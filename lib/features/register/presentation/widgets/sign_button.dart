import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignButton extends StatelessWidget {
  const SignButton({super.key,required this.text, required this.color});
final String text;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(

width: 350.w,
height: 55.h,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(30.r),
  color: color
),

child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.bold),)),

    );
  }
}