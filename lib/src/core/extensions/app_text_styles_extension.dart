import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

extension AppTextStylesExtension on BuildContext {
  AppTextStyles get textStyles => AppTextStyles.instance;
}
