import 'package:flutter/material.dart';
import 'package:weather/core/utils/app_colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'SF-Pro-Display',
    textTheme: _lightTextTheme(),
    iconTheme: const IconThemeData(color: AppColors.TBlack2),
    colorScheme: _lightColorScheme(),
  );
}

TextTheme _lightTextTheme() {
  return const TextTheme(
    headline1: TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
    bodyText1: TextStyle(
        color: AppColors.TBlack1, fontSize: 14, fontWeight: FontWeight.w600),
    subtitle1: TextStyle(
        color: AppColors.TGrey, fontSize: 12, fontWeight: FontWeight.w400),
    subtitle2: TextStyle(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
  );
}

ColorScheme _lightColorScheme() {
  return const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.white,
    onPrimary: Colors.white,
    secondary: Colors.white,
    onSecondary: Colors.white,
    error: Colors.white,
    onError: Colors.white,
    background: Colors.white,
    onBackground: AppColors.TGrey1,
    surface: Colors.white,
    onSurface: Colors.white,
  );
}
