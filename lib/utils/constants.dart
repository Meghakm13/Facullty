import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF52357B);
  static const accent = Color(0xFF5459AC);
  static const light = Color(0xFF648DB3);
  static const background = Color(0xFFB2D8CE);
}

class AppSpacing {
  static const screenPadding = EdgeInsets.all(12.0);
  static const cardRadius = 12.0;
}

class AppTextStyle {
  static const title = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    fontSize: 16,
  );
}
