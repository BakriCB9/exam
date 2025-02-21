import 'package:exam_app/config/appColor.dart';
import 'package:exam_app/config/appFontsize.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
            color: AppColor.placeHolder, fontSize: AppFontSize.fontSize16),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: AppColor.grey)),
        // border: OutlineInputBorder(
        //     borderSide: BorderSide(color: AppColor.lightRed)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.redError)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: AppColor.grey)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.redError)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      textTheme: TextTheme(
          labelMedium: TextStyle(
              color: AppColor.placeHolder, fontSize: AppFontSize.fontSize14),
          labelSmall: TextStyle(
              color: AppColor.grey,
              fontSize: AppFontSize.fontSize14,
              fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(
              fontSize: AppFontSize.fontSize16, color: AppColor.blackBase),
          bodySmall: TextStyle(
              fontSize: AppFontSize.fontSize12, color: AppColor.blackBase)),

      ///button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: AppColor.blueBase)));
}
