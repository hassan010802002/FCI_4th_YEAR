// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Config/AppConfigs.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/LogInScreen/Constants/LogInConsts.dart';

class LogInTitleTextWidget extends StatefulWidget {
  const LogInTitleTextWidget({super.key});

  @override
  _LogInTitleTextWidgetState createState() => _LogInTitleTextWidgetState();
}

class _LogInTitleTextWidgetState extends State<LogInTitleTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      LogInConsts.titleText,
      softWrap: true,
      style: TextStyle(
        color: LogInConsts.titleColor,
        fontWeight: FontWeight.w800,
        fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)!/13.0.sp,
        fontFamily: BoldTextFontFamily,
      ),
      textAlign: TextAlign.start,
    );
  }
}
