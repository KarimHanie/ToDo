import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff5D9CEC);
  static const Color backgroundlight = Color(0xffDFECDB);
  static const Color backGroundDark = Color(0xff060E1E);
  static const Color black = Color(0xff363636);
  static const Color white = Color(0xffffffff);
  static const Color grey = Color(0xffC8C9CB);
  static const Color green = Color(0xff61E757);
  static const Color red = Color(0xffEC4B4B);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: backgroundlight,
    textTheme: TextTheme(
      titleMedium:
          TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: black),
      titleSmall:
          TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: black),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: white,
      selectedItemColor: primary,
      unselectedItemColor: grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: white,
        shape: CircleBorder(side: BorderSide(width: 4, color: white))),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: primary)
    ),
  );

  static ThemeData darkTheme = ThemeData();
}
