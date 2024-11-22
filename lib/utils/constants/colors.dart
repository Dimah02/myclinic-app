import 'package:flutter/material.dart';

class KColors {
  KColors._();
  // App Basic Colors
  static const secondary = Color(0xff85849B);

  // Text Colors
  static const Color textPrimary = Color(0xff333333);
  static const Color textSecondary = Color(0xff6c7570);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color light = Color(0xfff6f6f6);
  static const Color dark = Color(0xff272727);
  static const Color primaryBackground = Color(0xfff3f5ff);

  // new colors
  static const Color primaryGray =
      Color(0xff0B0A37); // add .withOpacity(0.20) when using it
  static const Color primary = Color(0xff0B0A37);
  static const Color accentColor = Colors.blueGrey;

  // Background Container Colors
  static const lightContainer = Color(0xfff6f6f6);
  static Color darkContainer = Colors.white.withOpacity(0.1);

  // Button Colors
  static const Color buttonSecondary = Color(0xff6c7570);
  static const Color buttonDisabled = Color(0xffc4c4c4);

  //Border Colors
  static const Color borderPrimary = Color(0xffD9D9D9);
  static const Color borderSecondary = Color(0xffE6E6E6);

  //Error and Validation Colors
  static const Color error = Color(0xffcc0000);
  static const Color success = Color(0xff00cc00);
  static const Color warning = Color(0xffffcc00);
  static const Color info = Color(0xff197602);

  //Neutral Shades
  static const Color black = Color(0xff232323);
  static const Color darkerGrey = Color(0xff4f4f4f);
  static const Color darkGrey = Color(0xff939393);
  static const Color grey = Color(0xffe0e0e0);
  static const Color softGrey = Color(0xfff4f4f4);
  static const Color lightGrey = Color(0xfff9f9f9);
  static const Color white = Color(0xffffffff);
}
