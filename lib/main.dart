import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

//Create a Color Scheme.  --> use k<variable_name> when declaring global varibales
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  runApp(
    MaterialApp(
      //Darkmode theme
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,

        //CARD theme for Dark MODE
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),

        //Elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer, //Colors content inside button
          ),
        ),
      ),

      //Lightmode theme
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,

        //APPBAR theme
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        //CARD Theme
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        //Elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        //Text theme
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                //titleLarge---->Changes all main title text style
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      themeMode:
          ThemeMode.system, //Set the theme according to the system's theme
      home: const Expenses(),
    ),
  );
}
