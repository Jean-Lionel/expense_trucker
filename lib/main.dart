import 'package:expense_trucker/widget/expenses.dart';
import 'package:flutter/material.dart';

var kColorShema = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);
var kDarkModeColorShema = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        cardTheme: const CardTheme().copyWith(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorShema,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorShema.onPrimaryContainer,
          foregroundColor: kColorShema.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
            ),
      ),
      home: const Expenses(),
    );
  }
}
