import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskati_todo_app/core/utils/app_colors.dart';
import 'package:taskati_todo_app/core/utils/font_Style.dart';

final lightTheme = ThemeData(
  textTheme: TextTheme(
    displayLarge: getlargefont(color: Appcolors.buttonsColor),
    displaySmall: getsmallfont(color: Appcolors.buttonsColor),
    displayMedium: getmeduimfont(color: Appcolors.buttonsColor),
    bodySmall: getsmallfont(color: Appcolors.blackColor),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      titleTextStyle: getmeduimfont(
          fontweight: FontWeight.bold, color: Appcolors.buttonsColor),
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0.0),
  //-----------------Theme Of the inputDecoration---------------------
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: getnormalfont(),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Appcolors.buttonsColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Appcolors.buttonsColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Appcolors.redColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Appcolors.redColor),
    ),
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
);

final darkTheme = ThemeData(
  iconTheme: IconThemeData(color: Colors.black),
  //------------------------text Theme----------------------
  textTheme: TextTheme(
      displayLarge: getlargefont(color: Colors.white),
      displaySmall: getsmallfont(color: Colors.white),
      displayMedium: getmeduimfont(color: Colors.white)),
//----------------------------appbartheme-------------------------
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
      titleTextStyle: getmeduimfont(
          fontweight: FontWeight.bold, color: Appcolors.lightbackground),
      backgroundColor: Appcolors.buttonsColor,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0.0),
  //----------------------The inputDecorations of Dark Mode --------------------
  inputDecorationTheme: InputDecorationTheme(
    suffixIconColor: Colors.white,
    prefixIconColor: Colors.white,
    hintStyle: getnormalfont(color: Colors.white),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Appcolors.buttonsColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Appcolors.buttonsColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Appcolors.redColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Appcolors.redColor),
    ),
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
);
