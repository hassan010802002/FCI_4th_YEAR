// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:souqey/Config/AppConfigs.dart';
import 'package:souqey/Screens/BaseHome/Constants/Colors/BaseHomeColors.dart';

class BaseHomeStyles {
  //////////////////////////////////TextStyles///////////////////////////////////

  static TextStyle Function(BuildContext context) textStyle1 = (context) => TextStyle(
        fontFamily: TextFontFamily,
        fontWeight: FontWeight.w600,
        color: BaseHomeColors.color10,
      );
  static TextStyle Function(BuildContext context) textStyle2 = (context) => TextStyle(
        fontFamily: TextFontFamily,
        fontWeight: FontWeight.w600,
        color: BaseHomeColors.color6,
      );
}
