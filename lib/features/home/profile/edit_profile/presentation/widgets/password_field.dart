import 'package:exam_app/config/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../register/presentation/widgets/sign_field.dart';

Widget buildPasswordField() {
  return SignField(
    
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
            size: 20,
            color: Colors.black54,
          );
        }),
      ),
    ),
  );
}