import 'package:exam_app/config/appColor.dart';
import 'package:exam_app/core/routes_manager/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/sign_field.dart';

Widget buildPasswordField(BuildContext context) {
  return Stack(
    children: [SignField(
      
      enabled: false,
      hint: "",
      label: "password",
      widget: Padding(
        padding: EdgeInsets.only(left: 15.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            return Icon(
              Icons.star,
              size: 20.r,
              color: Colors.black54,
            );
          }),
        ),
      ),
    ),
    
     Positioned(
          right: 20.w,
          bottom: 15.h,
          child:
          InkWell(
              onTap: ()=>Navigator.of(context).pushNamed(Routes.changePasswordRoute),
              child:Text("Change",style: TextStyle(fontWeight:FontWeight.bold,color: AppColor.blue60),)),
    )
    ]
  );
}