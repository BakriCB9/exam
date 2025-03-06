import 'package:exam_app/config/appColor.dart';
import 'package:exam_app/config/appFontsize.dart';
import 'package:exam_app/config/appString.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Row(
      children: [
        Checkbox(
            activeColor: AppColor.blueBase,
            value: isCheck,
            onChanged: (value) {
              setState(() {
                isCheck = value ?? false;
              });
            }),
        Text(
          AppString.remember,
          style: theme.bodySmall?.copyWith(fontSize: AppFontSize.fontSize13),
        )
      ],
    );
  }
}
