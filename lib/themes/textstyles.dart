import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  static const largeTextStyle = TextStyle(
    fontSize: 100,
    color: AppColors.textColor,
    fontWeight: FontWeight.w500,
  );
  static const mediumTextStyle = TextStyle(
    fontSize: 20,
    color: AppColors.textColor,
  );
  static const kFs25 = TextStyle(
    color: AppColors.textColor,
    fontSize: 25,
  );
  static const kFcWhite = TextStyle(
    color: AppColors.textColor,
  );
  static const cardTextSyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );
  static const kFcSubtextColor = TextStyle(
    color: AppColors.subTextColor,
  );
  static const cardTextDataStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );
}
