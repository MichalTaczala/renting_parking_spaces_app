import 'package:flutter/material.dart';

final mainTheme = ThemeData(
  primaryColor: Colors.blue,
  primaryTextTheme: const TextTheme(),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      minimumSize: MaterialStatePropertyAll(
        Size.fromHeight(60),
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: AppColors.brown,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.blue,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue,
      ),
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 72.0,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 50.0,
      fontStyle: FontStyle.italic,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
    ),
  ),
);

class AppColors {
  static const brown = Color.fromARGB(255, 32, 22, 18);
}
