// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Config/AppConfigs.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/HomeScreen/Constants/Colors/HomeColors.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';

class HomeStyles {
  //////////////////////////////TextStyles/////////////////////////////

  static TextStyle? Function(BuildContext context) style7 = (context) => TextStyle(
        color: HomeColors.color2,
        fontWeight: FontWeight.w800,
        fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 11.0.sp,
        fontFamily: BoldTextFontFamily,
      );

  static TextStyle? Function(BuildContext context) style9 = (context) => TextStyle(
        color: HomeColors.color1,
        fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 6.0.sp,
        fontWeight: FontWeight.w800,
        fontFamily: BoldTextFontFamily,
      );

  static TextStyle? Function(BuildContext context) style10 = (context) => TextStyle(
        fontFamily: TextFontFamily,
        fontWeight: FontWeight.w600,
        fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 25.0.sp,
        color: HomeColors.color1,
      );

  static TextStyle? Function(BuildContext context) style1 = (context) => TextStyle(
        color: HomeColors.color4,
        fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 36.0.sp,
        fontWeight: FontWeight.w600,
        fontFamily: TextFontFamily,
      );

  /////////////////////////////////////////Containers Styles/////////////////////////////////////////////

  static BoxDecoration? Function(BuildContext context, HomeControllerBloc homeController) containerStyle1 =
      (context, homeController) => BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                homeController.categoriesModel!.data!.elementAt(homeController.activeCurrentIndex!).image!,
              ),
              alignment: Alignment.center,
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          );

  ////////////////////////////////////////Button Styles///////////////////////////////////////////////////

  static ButtonStyle? Function(BuildContext context) buttonStyle1 = (context) => ButtonStyle(
        fixedSize: MaterialStatePropertyAll(
          Size(
            MediaQuery_Size_Helper.MAX_WIDTH(context)! / 6.0.w,
            MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 36.0.h,
          ),
        ),
        alignment: Alignment.center,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textStyle: MaterialStatePropertyAll(
          TextStyle(
            color: HomeColors.color3,
            fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 32.0.sp,
            fontWeight: FontWeight.w600,
            fontFamily: TextFontFamily,
          ),
        ),
      );
}
