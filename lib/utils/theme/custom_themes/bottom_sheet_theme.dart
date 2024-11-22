import 'package:flutter/material.dart';
import 'package:myclinic/utils/constants/colors.dart';

class KBottomSheetTheme {
  KBottomSheetTheme._();
  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: KColors.white,
    modalBackgroundColor: KColors.white,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
