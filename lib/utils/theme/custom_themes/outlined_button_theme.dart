import 'package:flutter/material.dart';
import 'package:myclinic/utils/constants/colors.dart';

class KOutlinedButtonTheme {
  KOutlinedButtonTheme._();
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: KColors.primary,
      side: const BorderSide(color: KColors.primary),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      textStyle: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
