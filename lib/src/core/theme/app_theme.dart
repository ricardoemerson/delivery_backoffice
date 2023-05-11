import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static final defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(color: Colors.grey[400]!),
  );

  static final theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.instance.primary,
      primary: AppColors.instance.primary,
      secondary: AppColors.instance.secondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyles.instance.primaryButton,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      // isDense: true,
      contentPadding: const EdgeInsets.only(top: 15, left: 17, right: 17),
      border: defaultInputBorder,
      enabledBorder: defaultInputBorder,
      focusedBorder: defaultInputBorder,
      labelStyle: AppTextStyles.instance.textMedium.copyWith(
        color: Colors.black,
      ),
      errorStyle: AppTextStyles.instance.textRegular.copyWith(
        color: Colors.redAccent,
      ),
    ),
  );
}
