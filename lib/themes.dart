import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart' as yaru;
import 'package:adwaita/adwaita.dart' as adwaita;

class LightTheme {
  ThemeData yaruLight = yaru.yaruLight;
  ThemeData adwaitaLight = adwaita.lightTheme;

  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: Colors.white,
    appBarTheme:
        const AppBarTheme(color: Colors.white, foregroundColor: Colors.black),
    backgroundColor: Colors.grey[900],
  );
}

class DarkTheme {
  ThemeData yaruDark = yaru.yaruDark;
  ThemeData adwaitaDark = adwaita.darkTheme;

  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[900],
    brightness: Brightness.dark,
    primaryColor: Colors.grey[900],
    appBarTheme:
        AppBarTheme(color: Colors.grey[900], foregroundColor: Colors.white),
    backgroundColor: Colors.white,
  );
}
