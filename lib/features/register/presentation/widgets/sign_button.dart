import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignButton extends StatelessWidget {
  const SignButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

width: 350.w,
height: 55.h,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(30.r),
  color: const Color(0Xffb02369c
)
),

child: Center(child: Text("Signup",style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.bold),)),

    );
  }
}