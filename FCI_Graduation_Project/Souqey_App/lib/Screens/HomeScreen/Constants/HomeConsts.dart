// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:souqey/Screens/HomeScreen/Constants/Colors/HomeColors.dart';
import 'package:souqey/Screens/HomeScreen/Constants/Styles/HomeStyles.dart';
import 'package:souqey/Screens/HomeScreen/Constants/Texts/HomeTexts.dart';

class HomeConsts {
  ///*************************************Texts********************************************

  static final titleText = HomeTexts.forgetPasswordTitle;
  static final emailLabelText = HomeTexts.emailLabelText;
  static final forgetPasswordText2 = HomeTexts.forgetPasswordText2;

  ///***************************************Styles*****************************************
  static TextStyle? Function(BuildContext context) style1 = HomeStyles.style1;
  static TextStyle? Function(BuildContext context) style4 = HomeStyles.style4;
  static TextStyle? Function(BuildContext context) style5 = HomeStyles.style5;
  static TextStyle? Function(BuildContext context) style6 = HomeStyles.style6;

  ///***************************************Colors*****************************************

  static final Color screenBackGroundColor = HomeColors.screenBackGroundColor;
  static final Color titleColor = HomeColors.titleColor;
  static final Color emailLabelColor = HomeColors.emailLabelColor;
  static const Color color1 = HomeColors.color1;
  static final Color color2 = HomeColors.color2;
}
