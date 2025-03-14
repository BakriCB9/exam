import 'package:exam_app/features/home/profile/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../../register/presentation/widgets/sign_button.dart';

class ReusableButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;
  final EditProfileCubit? cubit;

  const ReusableButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
    this.cubit
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SignButton(
        color: color,
        text: text,
      ),
    );
  }
}
