// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:souqey/Screens/LogInScreen/Constants/Colors/LogInColors.dart';
import 'package:souqey/Screens/LogInScreen/Constants/Styles/LogInStyles.dart';
import 'package:souqey/Screens/LogInScreen/Constants/Texts/LogInTexts.dart';

class LogInConsts {
  ///***************************************Images*****************************************

  ///*************************************Texts********************************************

  static final titleText = LogInTexts.titleText;
  static final emailLabelText = LogInTexts.emailLabelText;
  static final passwordLabelText = LogInTexts.passwordLabelText;
  static final forgetPasswordText = LogInTexts.forgetPasswordText;
  static final socialAccountLoginText = LogInTexts.socialAccountLoginText;

  static final googleIcon = LogInTexts.googleIcon;
  static final facebookIcon = LogInTexts.facebookIcon;

  ///***************************************Styles*****************************************
  static TextStyle? Function(BuildContext context) style1 = LogInStyles.style1;
  static TextStyle? Function(BuildContext context) style4 = LogInStyles.style4;
  static TextStyle? Function(BuildContext context) style5 = LogInStyles.style5;
  static TextStyle? Function(BuildContext context) style6 = LogInStyles.style6;
  static TextStyle? Function(BuildContext context) style7 = LogInStyles.style7;

  static ButtonStyle? Function(BuildContext context) style2 = LogInStyles.style2;
  static ButtonStyle? Function(BuildContext context) style3 = LogInStyles.style3;

  ///***************************************Colors*****************************************

  static final Color screenBackGroundColor = LogInColors.screenBackGroundColor;
  static final Color titleColor = LogInColors.titleColor;
  static final Color emailLabelColor = LogInColors.emailLabelColor;
  static const Color color1 = LogInColors.color1;
  static final Color color2 = LogInColors.color2;
}
