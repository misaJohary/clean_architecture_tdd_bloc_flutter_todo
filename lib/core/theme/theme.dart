import 'package:flutter/material.dart';

const blackColor = Colors.black87;

const light = Color(0xFFf9f1f0);
const mColor = Color(0xFFfadcd9);
const medium = Color(0xFFf8afa6);
const strong = Color(0xFFf79489);
const primary = mColor;
const surface = Colors.white;
const on = strong;
const accentColor = Colors.white;

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  focusColor: mColor,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: on,
    secondary: accentColor,
    onSecondary: on,
    error: Colors.redAccent,
    onError: Colors.white,
    background: Colors.white,
    onBackground: on,
    surface: surface,
    onSurface: on,
  ),
  primaryColor: mColor,
  textTheme: const TextTheme(
      bodyText2: TextStyle(
        color: strong,
      ),
      headline3: TextStyle(
        color: strong,
        fontFamily: 'DancingScript',
      ),
      headline6: TextStyle(
        color: strong,
      )
      // headlineSmall: TextStyle(color: strong),
      ),
  // brightness: Brightness.light,
  backgroundColor: medium,
  scaffoldBackgroundColor: light,
  fontFamily: 'Comfortaa',
  // // colorScheme: ColorScheme(brightness: Brightness.light, primary: , onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface),
  // primaryColor: mColor,
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(strong),
    trackColor: MaterialStateProperty.all(light),
    overlayColor: MaterialStateProperty.all(Colors.transparent),
  ),
  iconTheme: const IconThemeData(
    color: strong,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Colors.white,
      onPrimary: strong,
      surfaceTintColor: Colors.white,
    ),
  ),
  // visualDensity: VisualDensity.adaptivePlatformDensity,
  // textButtonTheme: TextButtonThemeData(
  //   style: TextButton.styleFrom(
  //     primary: strong,
  //   ),
  // ),
  // listTileTheme: const ListTileThemeData(
  //   iconColor: strong,
  // ),
  // splashColor: mColor,
  // useMaterial3: true,
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
      // color: strong,
      size: 30,
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: strong),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    foregroundColor: strong,
  ),
  // iconTheme: const IconThemeData(
  //   color: strong,
  // ),
  // textTheme: const TextTheme(bodyText2: TextStyle(color: medium)),
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
  listTileTheme: const ListTileThemeData(textColor: medium),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  accentColor: Colors.grey,
  fontFamily: 'Comfortaa',
);
