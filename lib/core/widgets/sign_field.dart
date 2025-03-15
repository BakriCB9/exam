import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignField extends StatelessWidget {
  final String? label;
  final String hint;
  final TextEditingController? controller;
  final String? errorText;
final bool? enabled;
final Widget? widget;
final Widget? suffixWidget;

  const SignField({
    super.key,
     this.label,
    required this.hint,
     this.controller,
    this.errorText,
    this.enabled,
    this.widget,
    this.suffixWidget

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          
          enabled: enabled,
          controller: controller,
          decoration: InputDecoration(
            suffix: suffixWidget ,
            prefixIcon:widget ,
            errorStyle: TextStyle(color: Colors.red),
            labelText: label,
            hintText: hint,
            labelStyle: TextStyle(
              color: Colors.black54, // Same color as hint text in enabled state
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.8,
                color: errorText != null ? Colors.red : Colors.black45,
              ),
            ),
disabledBorder: OutlineInputBorder(
  borderSide: BorderSide(
    width: 1.8,
    color: errorText != null ? Colors.red : Colors.black45,
  ), ),
            hintStyle: TextStyle(
              color: Colors.black45, // Same color as hint text in enabled state
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.8,
                color: errorText != null ? Colors.red : Colors.black45,
              ),
            ),
          ),
        ),

        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 15,top: 5.0),
            child: Text(
              errorText!,
              style:  TextStyle(
                color: Colors.red,
                fontSize: 10.sp,
              ),
            ),
          ),
      ],
    );
  }
}
