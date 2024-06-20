// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:souqey/Screens/HomeScreen/Constants/Colors/HomeColors.dart';
import 'package:souqey/Screens/HomeScreen/Constants/Styles/HomeStyles.dart';
import 'package:souqey/Screens/HomeScreen/Constants/Texts/HomeTexts.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';

class HomeConsts {
  ///*************************************Texts********************************************

  static final homeStaggeredGridText = HomeTexts.homeStaggeredGridText;
  static final checkButtonText = HomeTexts.checkButtonText;
  static final fashionSaleText = HomeTexts.fashionSaleText;
  static final viewAllButtonText = HomeTexts.viewAllButtonText;
  static final categorySmallText = HomeTexts.categorySmallText;
  static final discountText = HomeTexts.discountText;

  ///***************************************Styles*****************************************

  static TextStyle? Function(BuildContext context) style7 = HomeStyles.style7;
  static TextStyle? Function(BuildContext context) style9 = HomeStyles.style9;
  static TextStyle? Function(BuildContext context) style10 = HomeStyles.style10;
  static TextStyle? Function(BuildContext context) style1 = HomeStyles.style1;
  static TextStyle? Function(BuildContext context) style2 = HomeStyles.style2;
  static TextStyle? Function(BuildContext context) style3 = HomeStyles.style3;
  static TextStyle? Function(BuildContext context) style4 = HomeStyles.style4;
  static TextStyle? Function(BuildContext context) style5 = HomeStyles.style5;
  static TextStyle? Function(BuildContext context) style6 = HomeStyles.style6;
  static TextStyle? Function(BuildContext context) style8 = HomeStyles.style8;
  static TextStyle? Function(BuildContext context) style11 = HomeStyles.style11;

  static BoxDecoration? Function(BuildContext context, HomeControllerBloc homeController) containerStyle1 = HomeStyles.containerStyle1;
  static BoxDecoration? Function(BuildContext context, HomeControllerBloc homeController, int categoryViewIdx, int productViewIdx) containerStyle3 =
      HomeStyles.containerStyle3;
  static ShapeDecoration? Function(BuildContext context) containerStyle2 = HomeStyles.containerStyle2;

  static ButtonStyle? Function(BuildContext context) buttonStyle1 = HomeStyles.buttonStyle1;

  ///***************************************Colors*****************************************

  static final Color screenBackGroundColor = HomeColors.screenBackGroundColor;
  static const Color color1 = HomeColors.color1;
  static final Color color2 = HomeColors.color2;
  static final Color color3 = HomeColors.color3;
  static final Color color4 = HomeColors.color4;
  static final Color color5 = HomeColors.color5;
  static final Color color6 = HomeColors.color6;
}
