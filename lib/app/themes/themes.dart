import 'package:flutter/material.dart';
import 'borders.dart';
import 'text_styles.dart';
import 'colors.dart';

class Themes {
  static ThemeData themeData() {
    return ThemeData(
      primaryColor: AppColors.primary,
      fontFamilyFallback: const ['Nunito', 'Rubik'],
      fontFamily: 'Nunito',
      textTheme: TextTheme(
        bodySmall: AppTextStyles.nunitoRegularSmall,
        bodyMedium: AppTextStyles.nunitoRegularMedium,
        bodyLarge: AppTextStyles.nunitoRegularLarge,
        headlineLarge: AppTextStyles.nunitoBoldTitleLarge,
        labelSmall: AppTextStyles.rubikRegularSmall,
        labelMedium: AppTextStyles.rubikRegularMedium,
        labelLarge: AppTextStyles.rubikRegularLarge,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppTextStyles.rubikRegularLarge.copyWith(
          color: AppColors.hintText,
        ),
        errorStyle: AppTextStyles.rubikRegularSmall.copyWith(
          color: AppColors.error,
        ),
        border: AppBorders.input.borderOutline,
        enabledBorder: AppBorders.input.borderOutline,
        focusedBorder: AppBorders.input
            .copyWithAll(color: AppColors.primary)
            .borderOutline,
        errorBorder:
            AppBorders.input.copyWithAll(color: AppColors.error).borderOutline,
        focusedErrorBorder:
            AppBorders.input.copyWithAll(color: AppColors.error).borderOutline,
        disabledBorder: AppBorders.input
            .copyWithAll(color: AppColors.disabled)
            .borderOutline,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          fixedSize: const MaterialStatePropertyAll(Size(370, 48)),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return AppColors.darken(AppColors.primary, .03);
              } else if (states.contains(MaterialState.disabled)) {
                return AppColors.lighten(AppColors.primary, .03);
              }

              return AppColors.primary;
            },
          ),
        ),
      ),
      useMaterial3: true,
    );
  }
}
