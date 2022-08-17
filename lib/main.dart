import 'package:flutter/material.dart';
import 'package:todo_app/home/home_screen.dart';
import 'package:todo_app/my_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme,
      routes: {
        HomeScreen.RouteName: (_) => HomeScreen(),
        HomeScreen.RouteName: (_) => HomeScreen()
      },
      initialRoute: HomeScreen.RouteName,
    );
  }
}