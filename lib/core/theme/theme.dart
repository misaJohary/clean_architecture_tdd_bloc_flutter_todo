import 'package:flutter/material.dart';

const blackColor = Colors.black87;

ThemeData theme = ThemeData(
  primaryColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Colors.white,
      onPrimary: blackColor,
      surfaceTintColor: Colors.white,
    ),
  ),
  // buttonTheme: const ButtonThemeData(buttonColor: Colors.white),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    titleTextStyle: TextStyle(color: blackColor, fontSize: 18),
    iconTheme: IconThemeData(
      color: blackColor,
      size: 18,
    ),
    actionsIconTheme: IconThemeData(
      color: blackColor,
      size: 30,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    foregroundColor: blackColor,
  ),
  iconTheme: const IconThemeData(
    color: blackColor,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(
      fontSize: 13,
      color: Colors.black45,
    ),
  ),
);
