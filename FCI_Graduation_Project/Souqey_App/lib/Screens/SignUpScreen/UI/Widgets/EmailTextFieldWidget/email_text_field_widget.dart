// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Components/CustomTextField/CustomTextField.dart';
import 'package:souqey/Screens/SignUpScreen/Constants/SignUpConsts.dart';
import 'package:souqey/Screens/SignUpScreen/Controller/sign_up_controller_bloc.dart';

class EmailTextFieldWidget extends StatefulWidget {
  final SignUpControllerBloc signUpController;

  const EmailTextFieldWidget({super.key, required this.signUpController});

  @override
  _EmailTextFieldWidgetState createState() => _EmailTextFieldWidgetState();
}

class _EmailTextFieldWidgetState extends State<EmailTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: SignUpConsts.emailLabelText,
      labelStyle: SignUpConsts.style1(context),
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
      textEditingController: widget.signUpController.emailController,
      fillColor: SignUpConsts.color1,
    );
  }
}