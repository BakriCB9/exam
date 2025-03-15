import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/sign_field.dart';

Widget buildTextField({
  required TextEditingController controller,
  required String hint,
  required String label,
  bool enabled = true,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 20.h),
    child: SignField(
      enabled: enabled,
      controller: controller,
      hint: hint,
      label: label,
    ),
  );
}
