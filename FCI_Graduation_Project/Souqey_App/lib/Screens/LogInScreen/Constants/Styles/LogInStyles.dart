// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Config/AppConfigs.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/LogInScreen/Constants/LogInConsts.dart';

class LogInStyles {
  //////////////////////////////TextStyles/////////////////////////////

  static TextStyle? Function(BuildContext context) style1 = (context) => TextStyle(
        color: LogInConsts.emailLabelColor,
        fontWeight: FontWeight.w500,
        fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 26.0.sp,
        fontFamily: TextFontFamily,
      );

  static TextStyle? Function(BuildContext context) style4 = (context) => TextStyle(
        color: LogInConsts.titleColor,
        fontFamily: TextFontFamily,
        fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 25.0.sp,
        fontWeight: FontWeight.w600,
      );

  static TextStyle? Function(BuildContext context) style5 = (context) => TextStyle(
        color: LogInConsts.color1,
        fontWeight: FontWeight.w600,
        fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 24.0.sp,
        fontFamily: TextFontFamily,
      );

  static TextStyle? Function(BuildContext context) style6 = (context) => TextStyle(
        color: LogInConsts.titleColor,
        fontWeight: FontWeight.w800,
        fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 13.0.sp,
        fontFamily: BoldTextFontFamily,
      );

  static TextStyle? Function(BuildContext context) style7 = (context) => TextStyle(
        fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 24.0.sp,
        fontWeight: FontWeight.w600,
        color: LogInConsts.titleColor,
        fontFamily: TextFontFamily,
      );

  //////////////////////////////Button Styles//////////////////////////////////

  static ButtonStyle? Function(BuildContext context) style2 = (context) => ButtonStyle(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconSize: MaterialStatePropertyAll(30.0.sp),
        alignment: Alignment.center,
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0.sp),
          ),
        ),
        backgroundColor: const MaterialStatePropertyAll(LogInConsts.color1),
        fixedSize: MaterialStatePropertyAll(
          Size(MediaQuery_Size_Helper.MAX_WIDTH(context)! / 4.0.w, MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 12.0.h),
        ),
      );

  static ButtonStyle? Function(BuildContext context) style3 = (context) => ButtonStyle(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        alignment: Alignment.centerRight,
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
          vertical: 10.0.h,
        )),
        iconSize: MaterialStatePropertyAll(18.0.sp),
        fixedSize: MaterialStatePropertyAll(
          Size(MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 4.2.w, MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 18.0.h),
        ),
        iconColor: MaterialStatePropertyAll(LogInConsts.color2),
      );
}
