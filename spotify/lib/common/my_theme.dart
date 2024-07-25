import 'package:flutter/material.dart';
import 'package:spotify/common/my_colors.dart';

class MyTheme {
  static ThemeData myTheme() {
    return ThemeData.dark().copyWith(
      appBarTheme: appBarTheme(),
      inputDecorationTheme: inputDecorationTheme(),
    );
  }

  static AppBarTheme appBarTheme() {
    return const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: MyColors.grey,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: MyColors.grey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: MyColors.grey,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
