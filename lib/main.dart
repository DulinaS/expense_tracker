import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

//Create a Color Scheme.  --> use k<variable_name> when declaring global varibales
var kColorScheme = ColorScheme.fromSeed(
  seedColor:const  Color.fromARGB(255, 96, 59, 181),
  );

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        )
      ),
      home: const Expenses(),
    ),
  );
}
