// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/Constants/Colors/ForgetPasswordColors.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/Constants/Styles/ForgetPasswordStyles.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/Constants/Texts/ForgetPasswordTexts.dart';

class ForgetPasswordConsts {
  ///*************************************Texts********************************************

  static final titleText = ForgetPasswordTexts.forgetPasswordTitle;
  static final emailLabelText = ForgetPasswordTexts.emailLabelText;
  static final forgetPasswordText2 = ForgetPasswordTexts.forgetPasswordText2;

  ///***************************************Styles*****************************************
  static TextStyle? Function(BuildContext context) style1 = ForgetPasswordStyles.style1;
  static TextStyle? Function(BuildContext context) style4 = ForgetPasswordStyles.style4;
  static TextStyle? Function(BuildContext context) style5 = ForgetPasswordStyles.style5;
  static TextStyle? Function(BuildContext context) style6 = ForgetPasswordStyles.style6;

  ///***************************************Colors*****************************************

  static final Color screenBackGroundColor = ForgetPasswordColors.screenBackGroundColor;
  static final Color titleColor = ForgetPasswordColors.titleColor;
  static final Color emailLabelColor = ForgetPasswordColors.emailLabelColor;
  static const Color color1 = ForgetPasswordColors.color1;
  static final Color color2 = ForgetPasswordColors.color2;
}
