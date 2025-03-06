import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final String? errorText; 

  const SignField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(

          controller: controller,
          decoration: InputDecoration(
            errorStyle: TextStyle(color: Colors.red),
            labelText: label,
            hintText: hint,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: errorText != null ? Colors.red : Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: errorText != null ? Colors.red : Colors.blue,
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
