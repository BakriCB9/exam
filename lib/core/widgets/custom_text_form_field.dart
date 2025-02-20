import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.label,
      required this.hintText,
      required this.controllerText});
  final String label;
  final String hintText;
  final TextEditingController controllerText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerText,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        label: Text(label),
        labelStyle: const TextStyle(color: Color(0xFFA6A6A6), fontSize: 15),
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: 14,
            color: Color(0xFFA6A6A6),
            fontWeight: FontWeight.normal),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF535353))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF535353))),
        // errorBorder: OutlineInputBorder()
      ),
    );
  }
}
