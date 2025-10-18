import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF2196F3);
  static const Color background = Color(0xFFF0F0F0);
  static const Color surface = Colors.white;
  static const Color textPrimary = Color(0xFF666666);
  static const Color textSecondary = Color(0xFF999999);
  static const Color border = Color(0xFFDDDDDD);
  static const Color shadow = Colors.black12;
  static const Color success = Colors.green;
}

class AppSizes {
  static const double borderRadius = 8.0;
  static const double cardRadius = 10.0;
  static const double padding = 20.0;
  static const double buttonHeight = 50.0;
  static const double shadowBlur = 10.0;
  static const Offset shadowOffset = Offset(0, 3);
}

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle labelText = TextStyle(
    color: AppColors.textPrimary,
  );

  static const TextStyle hintText = TextStyle(
    color: AppColors.textSecondary,
  );

  static const TextStyle linkText = TextStyle(
    color: AppColors.primary,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodyText = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 14,
  );

  static const TextStyle linkTextBold = TextStyle(
    color: AppColors.primary,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
}