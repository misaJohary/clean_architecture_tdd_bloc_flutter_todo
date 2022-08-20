import 'package:flutter/material.dart';

const blackColor = Colors.black87;

const light = Color(0xFFf9f1f0);
const mColor = Color(0xFFfadcd9);
const medium = Color(0xFFf8afa6);
const strong = Color(0xFFf79489);

ThemeData theme = ThemeData(
  scaffoldBackgroundColor: light,
  fontFamily: 'Comfortaa',
  primaryColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: light,
      onPrimary: strong,
      surfaceTintColor: light,
    ),
  ),
  listTileTheme: ListTileThemeData(
    iconColor: strong,
  ),
  splashColor: mColor,
  // buttonTheme: const ButtonThemeData(buttonColor: Colors.white),

  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    titleTextStyle: TextStyle(color: strong, fontSize: 18),
    iconTheme: IconThemeData(
      color: strong,
      size: 18,
    ),
    actionsIconTheme: IconThemeData(
      color: strong,
      size: 30,
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: strong),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    foregroundColor: strong,
  ),
  iconTheme: const IconThemeData(
    color: strong,
  ),
  textTheme: const TextTheme(bodyText2: TextStyle(color: medium)),
  hintColor: strong,
  focusColor: strong,
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(
      fontSize: 13,
      color: medium,
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: strong),
    ),
    focusColor: strong,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: strong),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: strong),
    ),
  ),
);
