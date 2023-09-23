import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTextStyles {
  static TextStyle nunitoRegularSmall = GoogleFonts.nunito(
    fontSize: 12,
    color: AppColors.text,
  );

  static TextStyle nunitoRegularMedium = GoogleFonts.nunito(
    fontSize: 14,
    color: AppColors.text,
  );

  static TextStyle nunitoRegularLarge = GoogleFonts.nunito(
    fontSize: 16,
    color: AppColors.text,
  );

  static TextStyle nunitoBoldTitleLarge = GoogleFonts.nunito(
    fontWeight: FontWeight.bold,
    fontSize: 28,
    color: AppColors.primary,
  );

  static TextStyle rubikRegularSmall = GoogleFonts.rubik(
    fontSize: 12,
    color: AppColors.text,
  );

  static TextStyle rubikRegularMedium = GoogleFonts.rubik(
    fontSize: 14,
    color: AppColors.text,
  );

  static TextStyle rubikRegularLarge = GoogleFonts.rubik(
    fontSize: 16,
    color: AppColors.text,
  );
}
