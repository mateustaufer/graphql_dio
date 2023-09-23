import 'package:flutter/material.dart';

import '../themes/colors.dart';

class AppSuffixIcon extends StatelessWidget {
  final void Function()? onTap;
  final bool hasError;
  final bool hasFocus;
  final bool isPassword;
  final bool isObscureText;

  const AppSuffixIcon({
    super.key,
    this.onTap,
    this.hasError = false,
    this.hasFocus = false,
    this.isPassword = false,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        hasError
            ? Icons.highlight_off
            : isPassword
                ? isObscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined
                : null,
        color: hasError
            ? AppColors.error
            : hasFocus
                ? AppColors.primary
                : AppColors.inputBorder,
      ),
    );
  }
}
