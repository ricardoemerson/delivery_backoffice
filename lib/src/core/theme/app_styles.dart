import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyles {
  static AppStyles? _instance;

  AppStyles._();

  static AppStyles get instance {
    _instance ??= AppStyles._();

    return _instance!;
  }

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        backgroundColor: AppColors.instance.primary,
      );
}
