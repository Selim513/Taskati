// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getlargefont(
    {FontWeight fontweight = FontWeight.bold,
    double fontsize = 20,
    color = Colors.black}) {
  return GoogleFonts.poppins(
      fontWeight: fontweight, fontSize: fontsize, color: color);
}

TextStyle getmeduimfont(
    {FontWeight fontweight = FontWeight.w500,
    double fontsize = 16,
    color = Colors.black}) {
  return GoogleFonts.poppins(
      fontWeight: fontweight, fontSize: fontsize, color: color);
}

TextStyle getsmallfont(
    {FontWeight fontweight = FontWeight.normal,
    double fontsize = 14,
    color = Colors.black}) {
  return GoogleFonts.poppins(
      fontWeight: fontweight, fontSize: fontsize, color: color);
}

TextStyle getnormalfont(
    {FontWeight fontweight = FontWeight.w400,
    double fontsize = 16,
    color = Colors.black}) {
  return GoogleFonts.lora(
      fontWeight: fontweight, fontSize: fontsize, color: color);
}
