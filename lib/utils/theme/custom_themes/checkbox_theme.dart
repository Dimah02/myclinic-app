import 'package:flutter/material.dart';
import 'package:myclinic/utils/constants/colors.dart';

class KCheckboxTheme {
  KCheckboxTheme._();
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return KColors.white;
      } else {
        return KColors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return KColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
