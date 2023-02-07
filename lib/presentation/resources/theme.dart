import 'package:flutter/material.dart';

enum AppTheme { lightTheme, darkTheme }

class AppThemes {
  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        primarySwatch: Colors.grey,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white)),
        ),
        textTheme:
            const TextTheme(titleMedium: TextStyle(color: Colors.black))),
    AppTheme.lightTheme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        primarySwatch: Colors.grey,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black)),
        ),
        textTheme:
            const TextTheme(titleMedium: TextStyle(color: Colors.white))),
  };
}
