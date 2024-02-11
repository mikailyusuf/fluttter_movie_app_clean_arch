import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme.__();

  static TextTheme lightTextTheme = TextTheme(
      bodyMedium: const TextStyle().copyWith(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500));

  static TextTheme darkTextTheme = TextTheme(
      bodyMedium: const TextStyle().copyWith(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500));
}
