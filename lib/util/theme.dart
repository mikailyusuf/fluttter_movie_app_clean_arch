import 'package:flutter/material.dart';
import 'package:movie_app/util/text_theme.dart';

class AppTheme {
  AppTheme.__();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      textTheme: AppTextTheme.lightTextTheme);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      textTheme: AppTextTheme.darkTextTheme);
}
