// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Components/Custom_Button/Custom_Button.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/Constants/ForgetPasswordConsts.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/Controller/forget_password_controller_bloc.dart';

class ResetForgetPasswordButtonWidget extends StatefulWidget {
  final ForgetPasswordControllerBloc _forgetPasswordController;

  const ResetForgetPasswordButtonWidget({super.key, required final ForgetPasswordControllerBloc forgetPasswordController})
      : _forgetPasswordController = forgetPasswordController;

  @override
  _ResetForgetPasswordButtonWidgetState createState() => _ResetForgetPasswordButtonWidgetState();
}

class _ResetForgetPasswordButtonWidgetState extends State<ResetForgetPasswordButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      style: ForgetPasswordConsts.style5(context),
      fixedSize: MaterialStatePropertyAll(
        Size(MediaQuery_Size_Helper.MAX_WIDTH(context)!, MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 15.0.h),
      ),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(45.0.sp),
      )),
      onPressed: () {
        widget._forgetPasswordController.resetForgetPasswordFunc();
      },
      backgroundColor: MaterialStatePropertyAll(ForgetPasswordConsts.color2),
      buttonText: "SEND",
    );
  }
}
