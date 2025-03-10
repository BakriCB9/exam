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
          labelLarge: TextStyle(
              color: AppColor.blueBase,
              fontSize: AppFontSize.fontSize20,
              fontWeight: FontWeight.w500),
          labelMedium: TextStyle(
              color: AppColor.placeHolder, fontSize: AppFontSize.fontSize16),
          labelSmall: TextStyle(
              color: AppColor.placeHolder,
              fontSize: AppFontSize.fontSize14,
              fontWeight: FontWeight.normal),
          bodyLarge: TextStyle(
              fontSize: AppFontSize.fontSize18,
              color: AppColor.blackBase,
              fontWeight: FontWeight.w500),
          bodyMedium: TextStyle(
              fontSize: AppFontSize.fontSize16, color: AppColor.blackBase),
          bodySmall: TextStyle(
              fontSize: AppFontSize.fontSize12, color: AppColor.blackBase)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.lightBlue,
        selectedItemColor: AppColor.blueBase,
        selectedLabelStyle: TextStyle(
            fontSize: AppFontSize.fontSize12,
            fontWeight: FontWeight.w600,
            color: AppColor.blueBase),
        unselectedLabelStyle: TextStyle(
            fontSize: AppFontSize.fontSize12,
            fontWeight: FontWeight.w600,
            color: AppColor.black30),
      ),
      // selectedIconTheme: IconThemeData(color: AppColor.blueBase,)),

      ///button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: AppColor.blueBase)));
}
