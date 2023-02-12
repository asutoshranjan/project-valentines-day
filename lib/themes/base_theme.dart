import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_valentines_day/themes/colors.dart';

/// Base text theme of the app.
final TextTheme textTheme = TextTheme(
  headline1: GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.w600,
  ),
  headline2: GoogleFonts.ibmPlexSans(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  ),
  bodyText1: GoogleFonts.sourceSansPro(
    fontSize: 21,
    fontWeight: FontWeight.w400,
  ),
  subtitle1: GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  ),
  subtitle2: GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  ),
);

/// Base theme for the app.
abstract class AppTheme {
  /// Private constructor for [AppTheme].
  AppTheme._();

  /// Base light theme of the app.
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    primaryColor: AppColors.white,
    textTheme: textTheme,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.black, foregroundColor: AppColors.white, elevation: 0),
    colorScheme: const ColorScheme.light(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: AppColors.black, elevation: 0, selectedItemColor: AppColors.white, unselectedItemColor: AppColors.deepBlue),
  );
}

