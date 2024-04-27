// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:souqey/Screens/SignUpScreen/Constants/Colors/SignUpColors.dart';
import 'package:souqey/Screens/SignUpScreen/Constants/Styles/SignUpStyles.dart';
import 'package:souqey/Screens/SignUpScreen/Constants/Texts/SignUpTexts.dart';

class SignUpConsts {
  ///***************************************Images*****************************************

  ///*************************************Texts********************************************

  static final titleText = SignUpTexts.titleText;
  static final emailLabelText = SignUpTexts.emailLabelText;
  static final nameLabelText = SignUpTexts.nameLabelText;
  static final passwordLabelText = SignUpTexts.passwordLabelText;
  static final forgetPasswordText = SignUpTexts.forgetPasswordText;
  static final socialAccountLoginText = SignUpTexts.socialAccountLoginText;

  static final googleIcon = SignUpTexts.googleIcon;
  static final facebookIcon = SignUpTexts.facebookIcon;

  ///***************************************Styles*****************************************
  static TextStyle? Function(BuildContext context) style1 = SignUpStyles.style1;
  static TextStyle? Function(BuildContext context) style4 = SignUpStyles.style4;
  static TextStyle? Function(BuildContext context) style5 = SignUpStyles.style5;
  static TextStyle? Function(BuildContext context) style6 = SignUpStyles.style6;
  static TextStyle? Function(BuildContext context) style7 = SignUpStyles.style7;

  static ButtonStyle? Function(BuildContext context) style2 = SignUpStyles.style2;
  static ButtonStyle? Function(BuildContext context) style3 = SignUpStyles.style3;

  ///***************************************Colors*****************************************

  static final Color screenBackGroundColor = SignUpColors.screenBackGroundColor;
  static final Color titleColor = SignUpColors.titleColor;
  static final Color emailLabelColor = SignUpColors.emailLabelColor;
  static const Color color1 = SignUpColors.color1;
  static final Color color2 = SignUpColors.color2;
}
