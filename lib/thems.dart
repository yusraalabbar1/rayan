import 'package:flutter/material.dart';

abstract class CustomTheme {
  static get lightTheme {
    //1
    return ThemeData(
        fontFamily: 'Mukta',
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(
            color: Color(0xff707070),
          ),
          focusColor: Colors.white,
          hoverColor: Colors.white,
          contentPadding: const EdgeInsets.all(20),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Color(0xff6268F1),
                width: 1.5,
              )),
          fillColor: const Color(0xff121E39),

          // hoverColor: Colors.white,
          filled: true,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Color(0xff6268F1),
                width: 1.5,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Color(0xff6268F1),
                width: 1.5,
              )),
        ),
        //////////////////////////////////////
        textTheme: TextTheme(
            headline6: TextStyle(color: Colors.grey[600]),
            headline3: const TextStyle(
              color: Color(0xff6268F1),
              fontFamily: 'Almarai',
              fontSize: 14,
              decoration: TextDecoration.underline,
            ),
            headline4: const TextStyle(
                color: Color(0xffF5F5F9),
                fontFamily: 'Almarai',
                fontSize: 14)));
  }
}
