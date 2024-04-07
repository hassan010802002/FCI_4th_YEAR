// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Components/CustomTextField/CustomTextField.dart';
import 'package:souqey/Config/AppConfigs.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/LogInScreen/Constants/LogInConsts.dart';
import 'package:souqey/Screens/LogInScreen/Controller/log_in_controller_bloc.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final LogInControllerBloc logInControllerBloc;
  const PasswordTextFieldWidget({super.key, required this.logInControllerBloc});

  @override
  _PasswordTextFieldWidgetState createState() => _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      opsecure: true,
      labelText: LogInConsts.passwordLabelText,
      labelStyle: TextStyle(
        color: LogInConsts.emailLabelColor,
        fontWeight: FontWeight.w500,
        fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 26.0.sp,
        fontFamily: TextFontFamily,
      ),
      keyboardType: TextInputType.emailAddress,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(8.0.sp),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(8.0.sp),
      ),
      textEditingController: widget.logInControllerBloc.passwordController,
      fillColor: LogInConsts.color1,
    );
  }
}
