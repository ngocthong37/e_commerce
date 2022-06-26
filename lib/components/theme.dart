import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Muli",
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
      inputDecorationTheme: inputDeconrationMethod(),
      primarySwatch: Colors.blue,
    );
  }

InputDecorationTheme inputDeconrationMethod() {
  var outlineInputBorder = OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(color: kTextColor),
          gapPadding: 10
        );
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor)
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      //brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
        headline4: TextStyle(color: Colors.black, fontSize: 19)
      )
    );
}