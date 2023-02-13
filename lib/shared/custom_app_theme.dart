import 'package:flutter/material.dart';

class CustomAppTheme {
  static ThemeData get light => ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 212, 65, 63),
        iconTheme: IconThemeData(
          color: Color.fromARGB(220, 255, 255, 255),
        ),
        titleTextStyle: TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 18.0,
            color: Color.fromARGB(220, 255, 255, 255),
            fontWeight: FontWeight.w900),
        centerTitle: true,
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 190, 166, 166),
      primaryColor: Colors.black38);
}
