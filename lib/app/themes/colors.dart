import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF00726F);
  static const Color backgroundResetPassword = Color(0xFF2cd5c4);
  static const Color text = Color(0xFF4A4C4C);
  static const Color textDisabled = Color(0xFFBEBFBF);
  static const Color textDark = Color(0xFF383939);
  static const Color hintText = Color(0xFF707272);
  static const Color hintTextLight = Color(0xFFCFCFCF);
  static const Color iconDark = Color(0xFF4A4C4C);
  static const Color inputBorder = Color(0xFF868787);
  static const Color error = Color(0xFFDE4644);
  static const Color disabled = Color(0xFFCECFCF);
  static const Color snackbarBackgroundFail = Color(0xFFFBCFD6);
  static const Color snackbarBackgroundAlert = Color(0xFFFFF3E0);
  static const Color snackbarBackgroundSuccess = Color(0xFFB9F4CB);
  static const Color snackbarTextFail = Color(0xFFAF302D);
  static const Color snackbarTextAlert = Color(0xFFFB8D00);
  static const Color snackbarTextSuccess = Color(0xFF029D27);
  static const Color backgroundHelpMeChat = Color(0xFFF4F5F7);
  static const Color headerHelpMeChat = Color(0xFF2DD5C4);

  static Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
