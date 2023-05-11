import 'package:flutter/material.dart';

import '../theme/app_styles.dart';

extension AppStylesExtension on BuildContext {
  AppStyles get styles => AppStyles.instance;
}
