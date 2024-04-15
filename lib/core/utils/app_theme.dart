
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';

class AppTheme {
   /// Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    primaryColor: AppColor.white,
    scaffoldBackgroundColor: AppColor.scaffold,
    appBarTheme: AppBarTheme(
        backgroundColor: AppColor.main,
      shadowColor: AppColor.main,
      elevation: 0,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: AppColor.secondary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: AppColor.secondary, width: 4),
        )
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          color: AppColor.textPrimary,
          fontSize: 22,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          // color: AppColor.textSecondary,
          color: AppColor.white,
          fontSize: 15,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
          color: AppColor.main,
          fontSize: 18,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700),
      bodyMedium: TextStyle(
          color: AppColor.textTertiary,
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600),
      bodySmall: TextStyle(
          color: AppColor.textSecondary,
          fontSize: 12,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400),
    ),
  );
  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    primaryColor: AppColor.secondaryDark,
    secondaryHeaderColor: AppColor.main,
    scaffoldBackgroundColor: AppColor.scaffoldDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.main,
      elevation: 30
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      shadowColor: AppColor.shadow,
      color: AppColor.secondaryDark,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: AppColor.secondaryDark, width: 4),
      )
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          color: AppColor.textPrimaryDark,
          fontSize: 22,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          color: AppColor.textSecondaryDark,
          fontSize: 15,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700),
      bodyLarge: TextStyle(
          color: AppColor.main,
          fontSize: 18,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700),
      bodyMedium: TextStyle(
          color: AppColor.white,
          fontSize: 15,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400),
      bodySmall: TextStyle(
          color: AppColor.textSecondaryDark,
          fontSize: 12,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400),
    ),
  );
}