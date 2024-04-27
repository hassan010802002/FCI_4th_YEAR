// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Config/AppConfigs.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/Constants/ForgetPasswordConsts.dart';

class ForgetPasswordStyles {
  //////////////////////////////TextStyles/////////////////////////////

  static TextStyle? Function(BuildContext context) style1 = (context) => TextStyle(
        color: ForgetPasswordConsts.emailLabelColor,
        fontWeight: FontWeight.w500,
        fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 26.0.sp,
        fontFamily: TextFontFamily,
      );

  static TextStyle? Function(BuildContext context) style4 = (context) => TextStyle(
        color: ForgetPasswordConsts.titleColor,
        fontFamily: TextFontFamily,
        fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 26.0.sp,
        fontWeight: FontWeight.w600,
      );

  static TextStyle? Function(BuildContext context) style5 = (context) => TextStyle(
        color: ForgetPasswordConsts.color1,
        fontWeight: FontWeight.w600,
        fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 24.0.sp,
        fontFamily: TextFontFamily,
      );

  static TextStyle? Function(BuildContext context) style6 = (context) => TextStyle(
        color: ForgetPasswordConsts.titleColor,
        fontWeight: FontWeight.w800,
        fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 13.0.sp,
        fontFamily: BoldTextFontFamily,
      );
}
