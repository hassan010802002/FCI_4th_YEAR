// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Components/CustomTextField/CustomTextField.dart';
import 'package:souqey/Screens/LogInScreen/Constants/LogInConsts.dart';
import 'package:souqey/Screens/LogInScreen/Controller/log_in_controller_bloc.dart';

class EmailTextFieldWidget extends StatelessWidget {
  final LogInControllerBloc logInControllerBloc;

  const EmailTextFieldWidget({super.key, required this.logInControllerBloc});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: LogInConsts.emailLabelText,
      labelStyle: LogInConsts.style1(context),
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
      textEditingController: logInControllerBloc.emailController,
      fillColor: LogInConsts.color1,
    );
  }
}
