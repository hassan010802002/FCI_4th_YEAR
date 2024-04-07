// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:souqey/Config/AppConfigs.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/LogInScreen/Constants/LogInConsts.dart';

class ForgetPasswordButtonWidget extends StatefulWidget {
  const ForgetPasswordButtonWidget({super.key});

  @override
  _ForgetPassworButtonWidgetState createState() => _ForgetPassworButtonWidgetState();
}

class _ForgetPassworButtonWidgetState extends State<ForgetPasswordButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(
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
      ),
      icon: Text(
        LogInConsts.forgetPasswordText,
        textAlign: TextAlign.right,
        softWrap: true,
        style: TextStyle(
          color: LogInConsts.titleColor,
          fontFamily: TextFontFamily,
          fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 25.0.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      label: const Icon(FontAwesomeIcons.arrowRightLong),
    );
  }
}
