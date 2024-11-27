import 'package:flutter/material.dart';
import 'package:myclinic/utils/constants/colors.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/dropdown_menu_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';

class KAppTheme {
  KAppTheme._();
  static ThemeData lighTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Manrope",
    brightness: Brightness.light,
    primaryColor: KColors.primary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: KTextTheme.lightTextTheme,
    elevatedButtonTheme: KElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: KAppbarTheme.lightAppBarTheme,
    bottomSheetTheme: KBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: KCheckboxTheme.lightCheckboxTheme,
    chipTheme: KChipTheme.lightChipTheme,
    outlinedButtonTheme: KOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: KTextFieldTheme.lightInputDecorationTheme,
    dropdownMenuTheme: KDropdownMenuTheme.lightdropDownTheme,
  );
}
