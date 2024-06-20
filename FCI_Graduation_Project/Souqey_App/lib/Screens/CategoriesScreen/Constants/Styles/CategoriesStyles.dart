// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Config/AppConfigs.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/CategoriesScreen/Constants/Colors/CategoriesColors.dart';

class CategoriesStyles {
  //////////////////////////////TextStyles/////////////////////////////
  static TextStyle Function(BuildContext context) appBarTitleStyle = (context) => TextStyle(
        color: CategoriesColors.color2,
        fontFamily: TextFontFamily,
        fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 18.0.sp,
        fontWeight: FontWeight.w600,
      );
  static TextStyle Function(BuildContext context) textStyle1 = (context) => TextStyle(
        color: CategoriesColors.color1,
        fontWeight: FontWeight.w800,
        fontFamily: TextFontFamily,
        fontSize: MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 35.0.sp,
      );
  static TextStyle Function(BuildContext context) textStyle2 = (context) => TextStyle(
        color: CategoriesColors.color1,
        fontWeight: FontWeight.w600,
        fontFamily: TextFontFamily,
        fontSize: MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 50.0.sp,
      );
  static TextStyle Function(BuildContext context) textStyle3 = (context) => TextStyle(
        fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 20.0.sp,
        fontFamily: TextFontFamily,
        fontWeight: FontWeight.w800,
        color: CategoriesColors.color2,
      );
  static TextStyle Function(BuildContext context) textStyle4 = (context) => TextStyle(
        color: CategoriesColors.color2,
        fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 20.0.sp,
        fontWeight: FontWeight.w600,
        fontFamily: TextFontFamily,
      );
  static TextStyle Function(BuildContext context) textStyle5 = (context) => TextStyle(
        color: CategoriesColors.color1,
        fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 30.0.sp,
        fontWeight: FontWeight.w600,
        fontFamily: TextFontFamily,
      );
  static TextStyle Function(BuildContext context) textStyle6 = (context) => TextStyle(
        color: CategoriesColors.color4,
        fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 20.0.sp,
        fontWeight: FontWeight.w600,
        fontFamily: TextFontFamily,
      );

  /////////////////////////////////////////Containers Styles/////////////////////////////////////////////
  static BoxDecoration Function() containerStyle1 = () => BoxDecoration(
        color: CategoriesColors.color1,
        borderRadius: BorderRadius.circular(12.0.sp),
      );
////////////////////////////////////////Button Styles///////////////////////////////////////////////////
}
