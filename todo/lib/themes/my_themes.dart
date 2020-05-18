import 'package:flutter/material.dart';

enum THEMES{
  DARKTHEME,  // stored 0 in hive
  PRIMARYTHEME // stored 1 in hive
}

Map<THEMES,ThemeData>myThemes={

  THEMES.DARKTHEME: ThemeData(
    brightness: Brightness.dark,
  ),
  THEMES.PRIMARYTHEME:ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.teal,
    accentColor: Colors.white,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22,
      ),
    ),
  ),
};