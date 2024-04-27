// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Components/Custom_Button/Custom_Button.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/LogInScreen/Constants/LogInConsts.dart';
import 'package:souqey/Screens/LogInScreen/Controller/log_in_controller_bloc.dart';

class LogInButtonWidget extends StatefulWidget {
  final LogInControllerBloc logInControllerBloc;

  const LogInButtonWidget({super.key, required this.logInControllerBloc});

  @override
  _LogInButtonWidgetState createState() => _LogInButtonWidgetState();
}

class _LogInButtonWidgetState extends State<LogInButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      style: LogInConsts.style5(context),
      fixedSize: MaterialStatePropertyAll(
        Size(MediaQuery_Size_Helper.MAX_WIDTH(context)!, MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 15.0.h),
      ),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(45.0.sp),
      )),
      onPressed: () {
        widget.logInControllerBloc.logInFunc();
      },
      backgroundColor: MaterialStatePropertyAll(LogInConsts.color2),
      buttonText: "LOGIN",
    );
  }
}
