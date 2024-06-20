// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:souqey/Screens/CategoriesScreen/Constants/Colors/CategoriesColors.dart';
import 'package:souqey/Screens/CategoriesScreen/Constants/Styles/CategoriesStyles.dart';
import 'package:souqey/Screens/CategoriesScreen/Constants/Texts/CategoriesTexts.dart';

class CategoriesConsts {
  ///*************************************Texts********************************************
  static final categoriesAppBarTitle = CategoriesTexts.categoriesAppBarTitle;
  static final categoriesSummerSalesText = CategoriesTexts.categoriesSummerSalesText;
  static final categoriesSummerSalesDiscountText = CategoriesTexts.categoriesSummerSalesDiscountText;
  static final categoriesViewAllItemsButtonText = CategoriesTexts.categoriesViewAllItemsButtonText;
  static final categoriesChooseCategoryText = CategoriesTexts.categoriesChooseCategoryText;

  ///***************************************Styles*****************************************
  static TextStyle Function(BuildContext context) appBarTitleStyle = CategoriesStyles.appBarTitleStyle;
  static TextStyle Function(BuildContext context) textStyle1 = CategoriesStyles.textStyle1;
  static TextStyle Function(BuildContext context) textStyle2 = CategoriesStyles.textStyle2;
  static TextStyle Function(BuildContext context) textStyle3 = CategoriesStyles.textStyle3;
  static TextStyle Function(BuildContext context) textStyle4 = CategoriesStyles.textStyle4;
  static TextStyle Function(BuildContext context) textStyle5 = CategoriesStyles.textStyle5;
  static TextStyle Function(BuildContext context) textStyle6 = CategoriesStyles.textStyle6;

  static BoxDecoration Function() containerStyle1 = CategoriesStyles.containerStyle1;

  ///***************************************Colors*****************************************

  static final Color screenBackGroundColor = CategoriesColors.screenBackGroundColor;
  static const Color color1 = CategoriesColors.color1;
  static final Color color2 = CategoriesColors.color2;
  static final Color color3 = CategoriesColors.color3;
  static final Color color4 = CategoriesColors.color4;
}
