import 'package:flutter/material.dart';
import 'package:myclinic/utils/constants/colors.dart';

class KElevatedButtonTheme {
  KElevatedButtonTheme._();
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: KColors.primary,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: KColors.primary),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      textStyle: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
