import 'package:flutter/material.dart';
import 'package:myclinic/utils/constants/colors.dart';

class KDropdownMenuTheme {
  KDropdownMenuTheme._();

  static DropdownMenuThemeData lightdropDownTheme = DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: KColors.primary,
    suffixIconColor: KColors.primary,
    labelStyle:
        const TextStyle().copyWith(fontSize: 12, color: KColors.primary),
    hintStyle: const TextStyle()
        .copyWith(fontSize: 12, color: KColors.primary.withOpacity(0.5)),
    errorStyle:
        const TextStyle().copyWith(fontSize: 12, fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: KColors.accentColor),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 1, color: KColors.accentColor),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 1, color: KColors.accentColor),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 1, color: Colors.black12),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 2, color: Colors.orange),
    ),
  ));
}
