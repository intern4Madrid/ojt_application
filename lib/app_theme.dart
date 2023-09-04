import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme {
  static double fontSize = 18.0;
  static bool isDarkMode = false;

  static Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkMode = prefs.getBool('isDarkMode') ?? false;
  }

  static Future<void> toggleTheme() async {
    isDarkMode = !isDarkMode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
  }

  static ThemeData get currentTheme {
    return isDarkMode ? darkTheme : lightTheme;
  }

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF9AC307),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: fontSize,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF9AC307),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: fontSize,
      ),
    ),
  );
}
