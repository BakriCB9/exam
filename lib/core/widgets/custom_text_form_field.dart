import 'package:flutter/material.dart';

typedef EventFunction = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controllerText,
    required this.validate,
  });
  final String label;
  final String hintText;
  final TextEditingController controllerText;
  final EventFunction validate;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return TextFormField(
      validator: validate,
      controller: controllerText,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          label: Text(label),
          labelStyle: theme.labelMedium,
          hintText: hintText,
          hintStyle: theme.labelSmall),
    );
  }
}
