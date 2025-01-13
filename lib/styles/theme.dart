import 'package:flutter/material.dart';
import 'package:app/styles/colors.dart';

enum ThemeType {
  light,
  dark,
}

class AppTheme {
  static ThemeType defaultTheme = ThemeType.light;

  bool isDark;
  Color kBlack;
  Color kWhite;

  /// Default constructor
  AppTheme({
    required this.isDark,
    required this.kBlack,
    required this.kWhite,
  });

  /// fromType factory constructor
  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.light:
        return AppTheme(
          isDark: false,
          kBlack: AppColors.primary,
          kWhite: AppColors.secondary,
        );

      case ThemeType.dark:
        return AppTheme(
          isDark: true,
          kBlack: AppColors.primaryDark,
          kWhite: AppColors.secondaryDark,
        );
    }
  }

  ThemeData get themeData {
    var t = ThemeData(
      useMaterial3: true,
    );
    return t.copyWith(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
