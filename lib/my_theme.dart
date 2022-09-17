import 'package:flutter/material.dart';

class MyTheme {
  static const Color primarylight = Colors.blue;
  static const Color primarydark = Color(0xFF5D9CEC);

  static const Color backgroundlight = Color(0xFFDFECDB);
  static const Color backgrounddark = Color(0xFF060E1E);
  static const Color green = Color(0xFF61E757);

  static final lightTheme = ThemeData(
      primaryColor: primarylight,
      scaffoldBackgroundColor: backgroundlight,
      appBarTheme: const AppBarTheme(
          color: primarylight,
          titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: primarydark,
          ),
          titleSmall: TextStyle(
              fontSize: 18, color: primarydark, fontWeight: FontWeight.normal),
          titleLarge: TextStyle(
              //whole bottom sheet add new task
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
              //whole bottom sheet add new task
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold),
          bodySmall: TextStyle(
            fontSize: 15,
            color: Colors.black,
          )));

  static final darkTheme = ThemeData(
      primaryColor: primarydark,
      scaffoldBackgroundColor: backgrounddark,
      appBarTheme: const AppBarTheme(
          color: primarydark,
          titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: primarydark,
          ),
          titleSmall: TextStyle(
              fontSize: 18, color: primarydark, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(
              //whole bottom sheet add new task
              fontSize: 24,
              color: backgrounddark,
              fontWeight: FontWeight.bold),
          titleLarge: TextStyle(
              //whole bottom sheet add new task
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold),
          bodySmall: TextStyle(
            fontSize: 15,
            color: Colors.white,
          )));
}
