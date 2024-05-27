import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    background: Color.fromARGB(255, 253, 221, 255),
    onBackground: Colors.teal,
    primary: Color.fromARGB(255, 0, 0, 0),
    secondary: Colors.amber,
    secondaryContainer: Colors.blueAccent,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.green[200],
  ),
);
