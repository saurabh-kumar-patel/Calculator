import 'package:flutter/material.dart';

import 'elevatedbutton.dart';

class Apptheme {
  Apptheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    elevatedButtonTheme: SElevatedButtonTheme.LightElevatedButtonTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    elevatedButtonTheme: SElevatedButtonTheme.DarkElevatedButtonTheme,
  );
}
