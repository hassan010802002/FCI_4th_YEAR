// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Components/CustomTextField/CustomTextField.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/Constants/ForgetPasswordConsts.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/Controller/forget_password_controller_bloc.dart';

class EmailTextFieldWidget extends StatelessWidget {
  final ForgetPasswordControllerBloc _forgetPasswordController;

  const EmailTextFieldWidget({super.key, required final ForgetPasswordControllerBloc forgetPasswordController})
      : _forgetPasswordController = forgetPasswordController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: ForgetPasswordConsts.emailLabelText,
      labelStyle: ForgetPasswordConsts.style1(context),
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
      textEditingController: _forgetPasswordController.emailController,
      fillColor: ForgetPasswordConsts.color1,
    );
  }
}
