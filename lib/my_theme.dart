import 'package:flutter/material.dart';

class MyTheme {
  static const Color primarylight = Color(0xFF5D9CEC);

  //static const Color primarylight = Colors.lightBlueAccent;
  // static const Color primarylight = Color(0xFF89CFF0);
  //static const Color primarylight = Color(0xFF77C3EC);

  static const Color primarydark = Color(0xFF5D9CEC);
  static const Color backgroundlight = Color(0xFFDFECDB);
  static const Color backgrounddark = Color(0xFF060E1E);

  static final lightTheme = ThemeData(
      // make object from themedata

      primaryColor: primarylight,
      scaffoldBackgroundColor: backgroundlight,
      // bottomSheetTheme: BottomSheetThemeData(
      //
      //   backgroundColor: backgroundlight
      // ),
      // scaffoldBackgroundColor: primarylight,
      appBarTheme: AppBarTheme(
          color: primarylight,
          titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      textTheme: TextTheme(
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: primarylight,
          ),
          titleSmall: TextStyle(
              fontSize: 18, color: primarylight, fontWeight: FontWeight.normal),
          titleLarge: TextStyle(
              //whole bottom sheet add new task
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold),
          bodySmall: TextStyle(
            fontSize: 12,
            color: Colors.black,
          )));

  static final darkTheme = ThemeData(
      primaryColor: primarydark,
      scaffoldBackgroundColor: Colors.white,

      //   scaffoldBackgroundColor: backgrounddark,
      appBarTheme: AppBarTheme(
          color: Colors.brown,
          titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: primarylight,
        ),
        bodyText2: TextStyle(
          fontSize: 12,
          color: primarylight,
        ),
        titleLarge: TextStyle(
            //add new task
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold),
      ));
}
