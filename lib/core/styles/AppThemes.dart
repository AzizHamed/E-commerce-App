import 'package:ecommerce_app/core/styles/AppColors.dart';
import 'package:flutter/material.dart';

class AppThemes{
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.secondaryColor,
    primaryColor: AppColors.primaryColor,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryColor,
    )
  );
}