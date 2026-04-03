import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      surface: Colors.white,
      primary: Colors.grey.shade300,
      secondary: Colors.grey.shade200,
    ) // ColorScheme. light
    );
// ThemeData
ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
    ));
   ThemeData darkBlueMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.indigo.shade900, 
    primary: Colors.indigo.shade800, 
    secondary: Colors.indigo.shade700, 
  ),
);