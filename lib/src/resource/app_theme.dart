import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light =>
      ThemeData(brightness: Brightness.light, primarySwatch: Colors.blue);

  static ThemeData get dark =>
      ThemeData(brightness: Brightness.dark, primarySwatch: Colors.blue);
}
