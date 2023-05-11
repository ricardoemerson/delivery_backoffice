import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;

  AppColors._();

  static AppColors get instance {
    _instance ??= AppColors._();

    return _instance!;
  }

  Color get primary => const Color(0xFF017D21);
  Color get secondary => const Color(0xFFFFAB18);
  Color get black => const Color(0xFF140E0E);
}
